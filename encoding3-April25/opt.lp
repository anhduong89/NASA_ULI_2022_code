

% find trajectory that that maximize profit
#maximize{R@1, D, X:revenue(R, D, X)}.
#minimize{C@0, D, X:cost(C, D, X)}.

passengers_served(Q, E) :- Q = #sum{W,D,X:as_w(D, E, X, W)}, request(_, E, _).

% #show dl/2.
#show as/3.
% #show ch_time/3.
#show as_w/4.
% #show no_passengers/3.
% #show passengers/3.

#show passengers_served/2.