%9.1.2-planning
%Nathan formulation
% gamma dollar per ton conversion for MER
% should look for two step forward but doing optimize single step.
% alpha dollar per mile to calculate fare, $/mile
#const alpha=1. % round up from 0.5 $/mile
#const dividealpha=2. % any multiplication with alpha must divide to dividealpha
#const gamma=185. % $/ton
#const speed=4. % 4mile per minute 240mph
#const accuracy = 100. % /100
#const dischg_rate=4.
#const capacity = 4.

% weight atom, need to change if capacity is not homogeneous
max_weight(4).
weight(0).
weight(W+1) :- max_weight(MW), weight(W), W < MW.

%horizon in minutes
horizon(360).

% generate segment ground atoms unit.
max_number_of_seg(10).
seg(0).
seg(X+1) :- seg(X), max_number_of_seg(M), X < M.

% ----- GENERATE ROUTING
%assign trip to segment
% as(D, (V1, V1'), X) :- seg(X), agent(D), max_number_of_seg(MX), X < MX, 
%                         MS=#min {S:distance((V, V'), S), not no_passengers(D, (V, V'), X), S > 0}, 
%                         edge(V1, V1'), distance((V1, V1'), MS).

1 {as(D, (V, V1), X+1); as(D, (V, V), X+1)} 1:- seg(X+1), agent(D), 
                                                max_number_of_seg(MX), X < MX, 
                                                MS= #min {S:distance((V, V'), S), not no_passengers(D, (V, V'), X), S > 0}, as(D, (_, V), X), distance((V, V1), MS).

as(D, (V, V'), 0) :- agent(D), init_loc(D, V), distance((V, V'), Smin), Smin = #min {S: distance((V, V1), S), S > 0}.

:- as(D, (V, V1), X), as(D, (V, V2), X), V1 != V2.

% 1 {as(D, (V, V'), X): edge(V, V')} 1 :- seg(X), agent(D), max_number_of_seg(MX), X < MX.

% :- as(D, (_, V), X), as(D, (V', _), X+1), V != V'.

% :- as(D, (V, _), 0), init_loc(D, V'), V != V'.


1 {passengers(D, (V, V'), X);no_passengers(D, (V, V'), X)} 1:- agent(D), seg(X), edge(V, V').

&diff {ready_v(D, V, X) - start_v(D', (V, V'), Y)} > 0 :- as_w(D', (V, V'), Y, W'),
                                                          capacity(D', C'), W' < C',
                                                          no_passengers(D, (V, V'), X).

