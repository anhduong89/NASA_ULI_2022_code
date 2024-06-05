% % revenue for each agent D at route X
% revenue(S*W*alpha/dividealpha, D, X) :- as_w(D, E, X, W), distance(E, S).



revenue(N, WR) :- edge_w((V, V'), W, T), request(N, V, V', WR, T), W > WR.
revenue(N, W) :- edge_w((V, V'), W, T), request(N, V, V', WR, T), W <= WR.
% find trajectory that that maximize profit
#maximize{R,N:revenue(N, R)}.
% #minimize{C@0, D, X:emission_cost(C, D, X)}.
% #minimize{C@0, D, X:charging_cost(C, D, X)}.



% passengers_served(Q, E) :- Q = #sum{W,D,X:as_w(D, E, X, W)}, request(_, E, _).

% #show dl/2.
% #show as/3.
% #show ch_time/3.
% #show as_rq/3.
#show revenue/2.
% #show not_as_rq/2.
% #show no_passengers/3.
% #show passengers/3.

% #show passengers_served/2.