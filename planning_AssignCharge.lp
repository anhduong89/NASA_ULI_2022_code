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


% generate segment ground atoms unit.
max_number_of_seg(10).
seg(0).
seg(X+1) :- seg(X), max_number_of_seg(M), X < M.

% ----- GENERATE ROUTING
%assign trip to segment
1 { as(D, (V, V'), X): edge(V, V')} 1 :- seg(X), agent(D), max_number_of_seg(MX), X < MX.

:- as(D, (_, V), X), as(D, (V', _), X+1), V != V'.

:- as(D, (V, _), 0), init_loc(D, V'), V != V'.

% ----- ASSIGN CHARGE DURATION
% energy level converted to energy-flight time( minutes that agents are able to be on the sky)
time(0..12).
#const time_ratio=5.
% % % assign charging time for each trip assigmment
1 {ch_time(D, X, Ct) : time(Ct)} 1 :- as(D, (V, V'), X), V!= V'.

% if assign a null edge then agent will not charge.
ch_time(D, X, 0) :- as(D, (V, V), X).

% total charge time should not excess the demanding flight energy
% :- TS = #sum{S: as(D, E, X), distance(E, S)}, TCt = #sum {Ct, X: ch_time(D, X, Ct)}, agent(D), TCt != ((TS-T0)/speed)*6, init_energy(D, T0, 0).

% convert battery to energy_time with time 
init_energy(D, B/(DCR*speed)) :- init_battery(D, B), dischg_rate(D, DCR).

% energy before charge at initial vertiport
&diff {beforeCharge(D, 0)-0} = T :- init_energy(D, T).

% energy after charge is equal to sum of energy before charge & energy gain from charge
&diff {afterCharge(D,X)-beforeCharge(D, X)} = Ct*time_ratio :- ch_time(D, X, Ct).

% energy after a flight (before charge at segment X+1) is equal to the deduction of flight discharge from current energy(which is after charge at segment X)
&diff { afterCharge(D, X)-beforeCharge(D, X+1)} = Ft :- as(D, E, X), distance(E, S), Ft = (S/speed).

% energy before charge and after charge must not excess roof and floor energy
&diff {afterCharge(D, X)-0} >= 0 :- seg(X), agent(D).
&diff {beforeCharge(D, X)-0} >= 0 :- seg(X), agent(D).
&diff {afterCharge(D, X)-0} <= 60 :- seg(X), agent(D).
&diff {beforeCharge(D, X)-0} <= 60 :- seg(X), agent(D).



% compute the cost regard the trip assignment and charging time, lmp_mer will be average value of give segment.
% cost(D, C) :- TCt = #sum{Ct*RATE, X:as(D, (V, _), X), ch_time(D, X, Ct), lmp_mer(V, X, RATE)}, agent(D), C = TCt/6.
cost(D, Ct*time_ratio*R/2, X) :- as(D, _, X), ch_time(D, X, Ct), lmp_mer(V, X, R).

% #minimize{C,D, X: cost(D, C, X)}.

#show init_energy/2.
#show init_battery/2.
#show as/3.