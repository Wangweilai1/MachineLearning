P = [-3 -2 -2 0 0 0 0 2 2 3;...
    0 1 -1 2 1 -1 -2 1 -1 0];
C = [1 1 1 2 2 2 2 1 1 1];
T = ind2vec(C);
net = newlvq(minmax(P), 4, [0.6 0.4], 0.1);
net.trainParam.epochs = 150;
net.trainParam.show = inf;
net = train(net, P, T);
W1 = net.IW{1};
W2 = vec2ind(net.LW{2});
i = 1;
for i = 1:10
    if C(i) == 1
        plot(P(1, i), P(2, i), '+');
        hold on
    else
        plot(P(1, i), P(2, i), '*');
        hold on;
    end
end
j = 1;
for j = 1:4
    if W2(j) == 1
        plot(W1(j, 1), W1(j, 2), 'diamond', 'markersize', 15);
        hold on;
    else
       plot(W1(j, 1), W1(j, 2), 'hexagram', 'markersize', 15);
        hold on;  
    end
end

%test
p1 = [0.2, 1];
a = vec2ind(sim(net, p1))