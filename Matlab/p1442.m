function p1442
p=[-1:0.05:1];
t0=sin(3*pi*p);
t=t0+0.15*randn(size(p));
load li137 net;
r=sim(net,p);
hold on;
plot(p,t0,'r-',p,t,'g+',p,r,'k');
xlabel('Ŀ������');ylabel('�������');
legend('�������������','���������','�����������')
figure
e=t0-r;
plot(p,e);
title('�������');
disp('������Ϊ��')
max(abs(e))