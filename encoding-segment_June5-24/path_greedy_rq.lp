%9.1.2-planning
%Nathan formulation
% gamma dollar per ton conversion for MER
% should look for two step forward but doing optimize single step.
% alpha dollar per mile to calculate fare, $/mile
% using Plana Aero RAM aircraft range 300miles; speed 185mph 
#const alpha=1. % round up from 0.5 $/mile
#const dividealpha=2. % any multiplication with alpha must divide to dividealpha
#const gamma=185. % $/ton
#const speed=3. % 3mile per minute 185mph

#const dischg_rate=4.
#const capacity = 4.
#const charging_rate = 250. %kW
#const divideCharging_rate = 4.
#const divideMER=100.

% #const minute_charged_per_mile = dischg_rate*60/250.
#const minute_charged_per_mile = 1.
% weight atom, need to change if capacity is not homogeneous
max_weight(4).
weight(0).
weight(W+1) :- max_weight(MW), weight(W), W < MW.

%horizon in minutes
horizon(360).

% generate segment ground atoms unit.
maxspan(6).
seg(0).
seg(X+1) :- seg(X), maxspan(M), X < M.

% ----- GENERATE ROUTING

% assign arc to agent-segment
% 1 {as(D, (V, V1), X); as(D, (V, V), X)} 1 :- agent(D), seg(X), maxspan(MX), X < MX, SM = #min{S: distance((V, V'), S), passengers(D, (V, V'), X)}, distance((V, V1), SM).
1 {as(D, (V, V'), X): edge(V, V')} 1 :- agent(D), seg(X), maxspan(MX), X < MX.

:- as(D, (_, V'), X), as(D, (V'', _), X+1), V' != V''.

:- init_loc(D, V), as(D, (V', _), 0 ), V != V'.

1 {as_rq(D, N, X): request(N, V, V', _, _); not_as_rq(D, X)} 1 :- as(D, (V, V'), X).


% 1 {passengers(D, (V, V'), X);no_passengers(D, (V, V'), X)} 1 :- seg(X), agent(D), edge(V, V'). 

% &diff {ready_v(D', V, X) - 0} = T :- request(N, V, V', W, T), C = #count {D: as_rq(D, N, _), D != D'}, W-C*4 < 4, no_passengers(D', (V, V'), X).

% &diff {ready_v(D', V, X) - 0} = T :- request(N, V, V', W, T), C = #count {D: as_rq(D, N, _), D != D'}, W-C*4 >=4, passengers(D', (V, V'), X).

% assign request that at departure time of agent
&diff {start_v(D, V, X) - 0} = T :- as_rq(D, N, X), request(N, V, V', _, T).


% not assign excess agent
:- C = #count {D: as_rq(D, N, _)}, request(N, _, _, W, _), C*4 - W >= 4.

% 
% no_passengers(N) :- C = #count {D: as_rq(D, N, _)}, request(N, _, _, W, _), C*4 - W >= 4.  


% :- as_rq(D, N, _), request(N, V, V', _, T), distance((V, V'), S), C = #count{D': as_rq(D', N', _)}, request(N', V'', V'''', W', T), distance((V'', V''''), S'), N != N', W' - C*4 >= 4, S > S'.

% explain why we want to use as_rq: 

% greedy for choosing arc; shortest in 

