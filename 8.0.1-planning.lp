
avai(D, V, 0) :- init_loc(D, V).


% #program plan(T).
%--------generation
0 {as(D, N, T): avai(D, V, T), agent(D), time(T)} 1 :- request(N, _, _, _, T), time(T).

% each drone can be assigned once at each time step.
:- as(D, N1, T), as(D, N2, T), N1 != N2, time(T).

% if number requests > number avai drone: all avai drone must be assigned
:- C1 = #count{N:request(N, _, _, _, T), time(T)}, C2=#count{D:avai(D, _, T), time(T)}, C3 = #count{N: as(_, N, T), time(T)}, time(T), C1 > C2, C3 != C2.

% if number requests < number avai drone: all requests must be assigned
:- C1= #count{N:request(N, _, _, _, T), time(T)}, C2=#count{D:avai(D, _, T), time(T)}, C3 = #count{N: as(_, N, T), time(T)}, time(T), C1 <= C2, C3 != C1.


%-------change location
%location of assigned agent but not at origin
avai(D, V', T+2) :- as(D, N, T), request(N, V1, V', _, T), avai(D, V, T), V!= V1, time(T).

% location of not assign agent
avai(D, V, T+1) :- not as(D, _, T), avai(D, V, T), time(T).

%location of assigned agent at origin
avai(D, V', T+1) :- as(D, N, T), request(N, V, V', _, T), avai(D, V, T), time(T).

%---------cost
cost(N, C, T) :- as(D, N, T), request(N, V1, V', _, _), avai(D, V, T), operation_cost(V1, V, C).

iteration_cost(TC, T) :- TC = #sum {C, N: cost(N, C, T), time(T)}, time(T).

#minimize{TC: iteration_cost(TC, T), time(T)}.

%--------- auxiliary
incomplete_request(N, T+1) :- request(N, V, V', W, T), not as(_, N, _), time(T).

request(N,V, V', W, T) :- new_request(N, T), request(N, V, V', W, _), time(T).

complete :- C = #count {D, N: as(D, N, _)}, total_request(TR), C = TR.

#show as(D, N, T): as(D, N, T), time(T).
% #show cost/3.
% #show iteration_cost/2.
% #show incomplete_request/2.
% #show request/5.
% #show avai(D, V, T) : avai(D, V, T), time(T).
% #show test/4.
% #show total_cost/1.
% #show time/1.
% #show request(N, V, V', W, T) : request(N, V, V', W, T), time(T1), T = T1.

% time(0..3).

% agent(0..2).
% vertiport(0..5).
% horizon(2).
% init_loc(0, 3).
% init_loc(1, 0).
% init_loc(2, 2).
% request(0, 1, 4, 20, 1).
% request(2, 1, 0, 22, 1).
% request(3, 2, 3, 23, 1).
% request(1, 4, 0, 21, 2).
% % request(4, 4, 1, 24, 2).
% % request(5, 2, 0, 21, 2).
% % request(6, 1, 4, 22, 2).

% operation_cost(0, 1, 21).
% operation_cost(1, 0, 21).
% operation_cost(0, 2, 23).
% operation_cost(2, 0, 23).
% operation_cost(0, 3, 24).
% operation_cost(3, 0, 24).
% operation_cost(0, 4, 22).
% operation_cost(4, 0, 22).
% operation_cost(1, 2, 24).
% operation_cost(2, 1, 24).
% operation_cost(1, 3, 22).
% operation_cost(3, 1, 22).
% operation_cost(1, 4, 22).
% operation_cost(4, 1, 22).
% operation_cost(2, 3, 20).
% operation_cost(3, 2, 20).
% operation_cost(2, 4, 20).
% operation_cost(4, 2, 20).
% operation_cost(3, 4, 24).
% operation_cost(4, 3, 24).
% operation_cost(0, 0, 0).
% operation_cost(1, 1, 0).
% operation_cost(2, 2, 0).
% operation_cost(3, 3, 0).
% operation_cost(4, 4, 0).