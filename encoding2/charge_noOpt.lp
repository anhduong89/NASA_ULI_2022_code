
% total charge time should not excess the demanding flight energy
% :- TS = #sum{S: as(D, E, X), distance(E, S)}, TCt = #sum {Ct, X: ch_time(D, X, Ct)}, agent(D), TCt != ((TS-T0)/speed)*6, init_energy(D, T0, 0).

% convert battery to energy_time with time 
init_energy(D, B/(DCR*speed)) :- init_battery(D, B), dischg_rate(D, DCR).

% energy before charge at initial vertiport
&diff {beforeCharge(D, 0)-0} = 0 :- agent(D).

% energy after charge is equal to sum of energy before charge & energy gain from charge
&diff {afterCharge(D,X)-beforeCharge(D, X)} = Ct*time_ratio :- as(D, E, X), distance(E, S), Ct = S/speed.

% energy after a flight (before charge at segment X+1) is equal to the deduction of flight discharge from current energy(which is after charge at segment X)
&diff { afterCharge(D, X)-beforeCharge(D, X+1)} = Ft :- as(D, E, X), distance(E, S), Ft = (S/speed).

% energy before charge and after charge must not excess roof and floor energy
&diff {afterCharge(D, X)-0} >= 0 :- seg(X), agent(D).
&diff {beforeCharge(D, X)-0} >= 0 :- seg(X), agent(D).
&diff {afterCharge(D, X)-0} <= 60 :- seg(X), agent(D).
&diff {beforeCharge(D, X)-0} <= 60 :- seg(X), agent(D).





