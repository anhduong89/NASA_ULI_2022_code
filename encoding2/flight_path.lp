% Horizon segment is fraction of horizon with shortest flight time
% Heuristic to assign shortest distance.
% heuristic cost.
#const alpha=1. % round up from 0.5 $/mile
#const dividealpha=2. % any multiplication with alpha must divide to dividealpha
#const gamma=185. % $/ton
#const speed=4. % 4mile per minute 240mph
#const accuracy = 100. % /100
#const dischg_rate=4.
#const capacity = 4.
#const time_ratio = 5.
% weight atom, need to change if capacity is not homogeneous
max_weight(4).
weight(0).
weight(W+1) :- max_weight(MW), weight(W), W < MW.

% horizon in minutes
horizon(360).

% hand craft trip A->B->C->A
group(1).
group(2).
group(3).
node_group(1, mbf).
node_group(1, mgt).
node_group(1, crj).
node_group(1, tci).
edge_group(1, (mbf, mgt)).
edge_group(1, (mgt, crj)).
edge_group(1, (crj, tci)).
edge_group(1, (tci, mbf)).

node_group(4, mbf).
node_group(4, mgt).
node_group(4, crj).
node_group(4, tci).
edge_group(4, (mgt, mbf)).
edge_group(4, (crj, mgt)).
edge_group(4, (tci, crj)).
edge_group(4, (mbf, tci)).

node_group(2, mbf).
node_group(2, crj).
node_group(2, lbm).
edge_group(2, (mbf, crj)).
edge_group(2, (crj, lbm)).
edge_group(2, (lbm, mbf)).

node_group(5, mbf).
node_group(5, crj).
node_group(5, lbm).
edge_group(5, (crj, mbf)).
edge_group(5, (lbm, crj)).
edge_group(5, (mbf, lbm)).

node_group(3, tci).
node_group(3, mgt).
node_group(3, lbm).
edge_group(3, (tci, mgt)).
edge_group(3, (mgt, lbm)).
edge_group(3, (lbm, tci)).

node_group(6, tci).
node_group(6, mgt).
node_group(6, lbm).
edge_group(6, (mgt, tci)).
edge_group(6, (lbm, mgt)).
edge_group(6, (tci, lbm)).

edge_group(G, (V, V)) :- node_group(G, V).

% generate segment ground atoms unit.
max_number_of_seg(1,10).
max_number_of_seg(2,7).
max_number_of_seg(3,7).
max_number_of_seg(4,10).
max_number_of_seg(5,7).
max_number_of_seg(6,7).
seg(1,0).
seg(2,0).
seg(3,0).
seg(4,0).
seg(5,0).
seg(6,0).
seg(G, X+1) :- seg(G, X), max_number_of_seg(G,M), X < M.

% ----- GENERATE ROUTING
%assign agent to group
1 {as_group(D, G): init_loc(D, V), node_group(G, V)} 1:- agent(D).

%assign trip to segment
1 { as(D, (V, V'), X): edge_group(G, (V, V'))} 1 :- seg(G, X), agent(D), as_group(D, G).

:- as(D, (_, V), X), as(D, (V', _), X+1), V != V'.

:- as(D, (V, _), 0), init_loc(D, V'), V != V'.

:- as(D, (V, V), X), as(D, (V, V'), X+1), V!=V'. 


#show seg/2.