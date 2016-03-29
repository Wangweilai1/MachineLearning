P = rands(2, 1000);
plot(P(1, :), P(2, :), '+r');
net = newsom([0 1; 0 1],[5, 6]);
net.trainParam.epochs = 3;
net = train(net, P);
plotsom(net.iw{1, 1}, net.layers{1}.distances);
P1 = [0.5; 0.3];
a = sim(net, P1) 