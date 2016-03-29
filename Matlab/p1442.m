function p1442
p=[-1:0.05:1];
t0=sin(3*pi*p);
t=t0+0.15*randn(size(p));
load li137 net;
r=sim(net,p);
hold on;
plot(p,t0,'r-',p,t,'g+',p,r,'k');
xlabel('目标向量');ylabel('拟合曲线');
legend('待拟合正弦曲线','加噪后曲线','网络拟合曲线')
figure
e=t0-r;
plot(p,e);
title('误差曲线');
disp('最大误差为：')
max(abs(e))