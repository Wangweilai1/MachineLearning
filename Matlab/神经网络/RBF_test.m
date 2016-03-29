P = -1:0.1:1;
T = [-.9602 -0.5770 -.0729 .3771 .6405 .6600 .4609 .1336 .2013 -.4344... 
    -.500 -.3930 -.1647 .0988 .3072 .3960 .3499 .1816 -.0312 -.2189 -.3201];
plot(P, T, '+');
title('Training Vectors');
xlabel('Input Vector P');
ylabel('Target Vector T');
eg = 0.02;
sc = 1;
net = newrb(P, T, eg, sc);
plot(P, T, '+');
xlabel('Input');
X = -1:.01:1;
Y = sim(net, X);
hold on;
plot(X, Y, 'r');
hold off;
