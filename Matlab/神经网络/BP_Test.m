P = 1:2:100;
T = sin(P * 0.1);
l = 3 : 12;
for i = 1:10
    NodeNum = l(i);
    TypeNum = 1;
    Epochs = 1000;
    TF1 = 'tansig';
    TF2 = 'purelin';
    net = newff(minmax(P), [NodeNum TypeNum], {TF1 TF2}, 'trainlm');
    net.trainParam.epochs = Epochs;
    net.trainParam.goal = 1e-8;
    net.trainParam.min_grad = 1e-20;
    net.trainParam.show = 200;
    net.trainParam.time = inf;
    net = train(net, P, T);
    P_test = 2:2:200;
    T_test = sin(P_test * 0.1);
    k = length(T_test);
    X = sim(net, P_test);
    for j = 1:k
        error(i) = abs(X(j) - T_test(j))/k;
    end
end
plot(1:length(P_test), T_test, 'r+', 1:length(P_test), X, 'bo')
title('+为真值, o为预测值');