% ----- TIME SCHEDULE WITH DIFFERENT CONSTRAINT
% start time at initial vertiport = charge duration
&diff {0-start(D, E, 0)} = -Ct*time_ratio :- as(D, E, 0), ch_time(D, 0, Ct).

% start time at vertiport X+1 - start time vertiport X = flight time (X, X+1) + charge time at vertiport X+1 
&diff {start(D, E', X+1)-start(D, E, X)} = T+Ct*time_ratio :- as(D, E', X+1), ch_time(D, X+1, Ct), distance(E, S), T = (S/speed), as(D, E, X).

% ------ DELIVERY SCHEDULE
% assign number of passengers
1 {as_w(D, (V, V'), X, W): weight(W)} 1 :- as(D, (V, V'), X), V!= V'.

as_w(D, (V, V), X, 0) :- as(D, (V, V), X).

% if agent D' pick up passenger after agent D and agent D carries less than its capacity then agent D will carry 0 passenger
&diff {start(D, E, X) - start(D', E, Y) } <= 0:- as_w(D, E, X, W), as_w(D', E, Y, W'), D!=D', capacity(D, C), capacity(D', C'), W < C, W' = 0.

% if agent D' pick up passenger after agent D and agent D' carries less than its capacity then agent D will carry full capacity
&diff {start(D, E, X) - start(D', E, Y) } <= 0:- as_w(D, E, X, W), as_w(D', E, Y, W'), D!=D', capacity(D, C), capacity(D', C'), W = C, W' < C.

% total passengers pick up at route E not excess demand.
:- TW = #sum{W: as_w(D, E, _, W)}, request(N, E, RW), TW > RW.

% revenue for each agent D at route X
revenue(S*W*alpha/dividealpha, D, X) :- as_w(D, E, X, W), distance(E, S).

#show.
#show dl/2.
#show cost/3.
#show revenue/3.
#show as/3.
#show ch_time/3.