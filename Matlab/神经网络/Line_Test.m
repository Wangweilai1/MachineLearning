P = [1.0 -1.2];
T = [0.5 1.0];
net = newlind(P, T);
A = sim(net, P)
E = T - A
SSE = sumsqr(E)
w_range = -1:0.1:1;
b_range = -1:0.1:1;
ES = errsurf(P, T, w_range, b_range, 'purelin');
plotes(w_range, b_range, ES);
plotep(net.IW{1,1}, net.b{1}, SSE);