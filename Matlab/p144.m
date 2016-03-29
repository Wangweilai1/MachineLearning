function p144
p=[-1:0.05:1];
t0=sin(3*pi*p);
t=t0+0.15*randn(size(p));
val.p=[-0.975:0.05:0.975];
val.t=sin(3*pi*val.p)+0.15*randn(size(val.p));
net=newff([-1 1],[20 1],{'tansig','purelin'},'traingdx');
net.trainparam.show=25;
net.trainparam.epochs=300;
net=init(net);
[net,tr]=train(net,p,t);
save li137 net;