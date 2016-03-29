P = 1:8;
P2 =0:0.1:9;
T = [0 1 2 3 2 1 2 1];
plot(P, T, '.', 'markersize', 30);
axis([0 9 -1 4]);
spread = 0.7;
net = newgrnn(P, T, spread);
A2 =sim(net, P2);
hold on;
plot(P2, A2, 'linewidth', 4, 'color', [1 0 0])
title('Function to approximate.');
xlabel('P and P2');
ylabel('T and A2');