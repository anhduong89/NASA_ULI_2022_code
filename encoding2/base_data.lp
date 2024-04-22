
%request(ID, (edge), number of request passenger)request(0, (mgt, lbm), 20).
request(1, (tci, lbm), 20).
request(2, (mbf, lbm), 20).
request(3, (crj, lbm), 20).
request(4, (lbm, mgt), 20).
request(5, (tci, mgt), 20).
request(6, (mbf, mgt), 20).
request(7, (crj, mgt), 20).
request(8, (lbm, tci), 20).
request(9, (mgt, tci), 20).
request(10, (mbf, tci), 20).
request(11, (crj, tci), 20).
request(12, (lbm, mbf), 20).
request(13, (mgt, mbf), 20).
request(14, (tci, mbf), 20).
request(15, (crj, mbf), 20).
request(16, (lbm, crj), 20).
request(17, (mgt, crj), 20).
request(18, (tci, crj), 20).
request(19, (mbf, crj), 20).
vertiport(lbm;mgt;tci;mbf;crj).
%LMP = 0.12$/kWh; MER = 0.000329 tons/kWh, gamma=185$/tons; lmp_mer = discharge_rate*(LMP+gamma*MER) = 4*0.19 = 0.76
%average lmp_mer = 0.76
%range for lmp_mer : [0.5 - 1]
%multiply by 2.
lmp_mer(lbm, 0, 1).
lmp_mer(mgt, 0, 2).
lmp_mer(tci, 0, 2).
lmp_mer(mbf, 0, 1).
lmp_mer(crj, 0, 2).
lmp_mer(lbm, 1, 1).
lmp_mer(mgt, 1, 2).
lmp_mer(tci, 1, 1).
lmp_mer(mbf, 1, 1).
lmp_mer(crj, 1, 1).
lmp_mer(lbm, 2, 1).
lmp_mer(mgt, 2, 2).
lmp_mer(tci, 2, 2).
lmp_mer(mbf, 2, 1).
lmp_mer(crj, 2, 1).
lmp_mer(lbm, 3, 1).
lmp_mer(mgt, 3, 1).
lmp_mer(tci, 3, 2).
lmp_mer(mbf, 3, 1).
lmp_mer(crj, 3, 2).
lmp_mer(lbm, 4, 1).
lmp_mer(mgt, 4, 1).
lmp_mer(tci, 4, 2).
lmp_mer(mbf, 4, 2).
lmp_mer(crj, 4, 1).
lmp_mer(lbm, 5, 1).
lmp_mer(mgt, 5, 1).
lmp_mer(tci, 5, 2).
lmp_mer(mbf, 5, 2).
lmp_mer(crj, 5, 1).
lmp_mer(lbm, 6, 1).
lmp_mer(mgt, 6, 2).
lmp_mer(tci, 6, 2).
lmp_mer(mbf, 6, 2).
lmp_mer(crj, 6, 1).
lmp_mer(lbm, 7, 1).
lmp_mer(mgt, 7, 2).
lmp_mer(tci, 7, 2).
lmp_mer(mbf, 7, 1).
lmp_mer(crj, 7, 1).
lmp_mer(lbm, 8, 1).
lmp_mer(mgt, 8, 2).
lmp_mer(tci, 8, 1).
lmp_mer(mbf, 8, 2).
lmp_mer(crj, 8, 2).
lmp_mer(lbm, 9, 1).
lmp_mer(mgt, 9, 2).
lmp_mer(tci, 9, 2).
lmp_mer(mbf, 9, 1).
lmp_mer(crj, 9, 2).
lmp_mer(lbm, 10, 2).
lmp_mer(mgt, 10, 2).
lmp_mer(tci, 10, 2).
lmp_mer(mbf, 10, 1).
lmp_mer(crj, 10, 1).
lmp_mer(lbm, 11, 2).
lmp_mer(mgt, 11, 2).
lmp_mer(tci, 11, 2).
lmp_mer(mbf, 11, 1).
lmp_mer(crj, 11, 2).
lmp_mer(lbm, 12, 1).
lmp_mer(mgt, 12, 1).
lmp_mer(tci, 12, 1).
lmp_mer(mbf, 12, 1).
lmp_mer(crj, 12, 2).
lmp_mer(lbm, 13, 2).
lmp_mer(mgt, 13, 1).
lmp_mer(tci, 13, 2).
lmp_mer(mbf, 13, 1).
lmp_mer(crj, 13, 2).
lmp_mer(lbm, 14, 2).
lmp_mer(mgt, 14, 2).
lmp_mer(tci, 14, 1).
lmp_mer(mbf, 14, 2).
lmp_mer(crj, 14, 2).
lmp_mer(lbm, 15, 1).
lmp_mer(mgt, 15, 1).
lmp_mer(tci, 15, 1).
lmp_mer(mbf, 15, 2).
lmp_mer(crj, 15, 1).
lmp_mer(lbm, 16, 1).
lmp_mer(mgt, 16, 1).
lmp_mer(tci, 16, 2).
lmp_mer(mbf, 16, 2).
lmp_mer(crj, 16, 1).
lmp_mer(lbm, 17, 2).
lmp_mer(mgt, 17, 1).
lmp_mer(tci, 17, 2).
lmp_mer(mbf, 17, 2).
lmp_mer(crj, 17, 1).
lmp_mer(lbm, 18, 1).
lmp_mer(mgt, 18, 1).
lmp_mer(tci, 18, 1).
lmp_mer(mbf, 18, 2).
lmp_mer(crj, 18, 1).
lmp_mer(lbm, 19, 1).
lmp_mer(mgt, 19, 1).
lmp_mer(tci, 19, 2).
lmp_mer(mbf, 19, 1).
lmp_mer(crj, 19, 2).
lmp_mer(lbm, 20, 1).
lmp_mer(mgt, 20, 2).
lmp_mer(tci, 20, 2).
lmp_mer(mbf, 20, 2).
lmp_mer(crj, 20, 2).
lmp_mer(lbm, 21, 1).
lmp_mer(mgt, 21, 2).
lmp_mer(tci, 21, 2).
lmp_mer(mbf, 21, 2).
lmp_mer(crj, 21, 2).
lmp_mer(lbm, 22, 2).
lmp_mer(mgt, 22, 2).
lmp_mer(tci, 22, 2).
lmp_mer(mbf, 22, 1).
lmp_mer(crj, 22, 1).
lmp_mer(lbm, 23, 1).
lmp_mer(mgt, 23, 2).
lmp_mer(tci, 23, 1).
lmp_mer(mbf, 23, 1).
lmp_mer(crj, 23, 2).
lmp_mer(lbm, 24, 2).
lmp_mer(mgt, 24, 1).
lmp_mer(tci, 24, 1).
lmp_mer(mbf, 24, 1).
lmp_mer(crj, 24, 2).
lmp_mer(lbm, 25, 1).
lmp_mer(mgt, 25, 2).
lmp_mer(tci, 25, 2).
lmp_mer(mbf, 25, 1).
lmp_mer(crj, 25, 1).
lmp_mer(lbm, 26, 2).
lmp_mer(mgt, 26, 2).
lmp_mer(tci, 26, 2).
lmp_mer(mbf, 26, 1).
lmp_mer(crj, 26, 2).
lmp_mer(lbm, 27, 1).
lmp_mer(mgt, 27, 2).
lmp_mer(tci, 27, 2).
lmp_mer(mbf, 27, 1).
lmp_mer(crj, 27, 2).
lmp_mer(lbm, 28, 1).
lmp_mer(mgt, 28, 2).
lmp_mer(tci, 28, 2).
lmp_mer(mbf, 28, 1).
lmp_mer(crj, 28, 2).
lmp_mer(lbm, 29, 1).
lmp_mer(mgt, 29, 1).
lmp_mer(tci, 29, 2).
lmp_mer(mbf, 29, 2).
lmp_mer(crj, 29, 1).
% 1 MW
ch_rate(lbm, 1).
ch_rate(mgt, 1).
ch_rate(tci, 1).
ch_rate(mbf, 1).
ch_rate(crj, 1).
% distance= miles/10
distance((lbm, lbm), 0).
distance((lbm, mgt), 132).
distance((lbm, tci), 218).
distance((lbm, mbf), 88).
distance((lbm, crj), 108).
distance((mgt, lbm), 132).
distance((mgt, mgt), 0).
distance((mgt, tci), 100).
distance((mgt, mbf), 103).
distance((mgt, crj), 61).
distance((tci, lbm), 218).
distance((tci, mgt), 100).
distance((tci, tci), 0).
distance((tci, mbf), 203).
distance((tci, crj), 160).
distance((mbf, lbm), 88).
distance((mbf, mgt), 103).
distance((mbf, tci), 203).
distance((mbf, mbf), 0).
distance((mbf, crj), 45).
distance((crj, lbm), 108).
distance((crj, mgt), 61).
distance((crj, tci), 160).
distance((crj, mbf), 45).
distance((crj, crj), 0).
edge(lbm, mgt).
edge(lbm, tci).
edge(lbm, mbf).
edge(lbm, crj).
edge(mgt, lbm).
edge(mgt, tci).
edge(mgt, mbf).
edge(mgt, crj).
edge(tci, lbm).
edge(tci, mgt).
edge(tci, mbf).
edge(tci, crj).
edge(mbf, lbm).
edge(mbf, mgt).
edge(mbf, tci).
edge(mbf, crj).
edge(crj, lbm).
edge(crj, mgt).
edge(crj, tci).
edge(crj, mbf).
edge(crj, crj).
edge(tci, tci).
edge(lbm, lbm).
edge(mbf, mbf).
edge(mgt, mgt).