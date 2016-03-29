function p201
%Elman神经网络用于峰值检波
time1=0:0.05:1.5*pi;
t1=time1/(1.5*pi)-0.5;
time2=1.5*pi:0.05:3*pi;
t2=1.5-time2/(1.5*pi);
time=[time1 time2];
t=2*[t1 t2];
p=(1+t).*cos(20*time);
net=newelm(minmax(p),[20 1],{'tansig','purelin'},'traingdx');
pq=con2seq(p);
tq=con2seq(t);
plot(time,p,time,1+t,'r--');
xlabel('输入/目标向量');ylabel('三角波信号');
pause
net.trainparam.epochs=500;
[net,tr]=train(net,pq,tq);
%三角波调制进行仿真
time1=0:0.05:2*pi;
t1=time1/(2*pi)-0.5;
time2=2*pi:0.05:4*pi;
t2=1.5-time2/(2*pi);
time=[time1 time2];
t=[t1 t2];
p=(1+t).*cos(20*time);
subplot(3,2,1);
plot(time,p);
xlabel('输入/目标向量');ylabel('三角波信号');
pq=con2seq(p);
a=sim(net,pq);
y=seq2con(a);
subplot(3,2,2);
plot(time,y{1},time,t,'r--');
xlabel('输入/目标向量');ylabel('三角波调制信号');
%正弦波调制进行仿真
t=0.5*sin(time);
p=(1+t).*cos(20*time);
subplot(3,2,3);
plot(time,p);
xlabel('输入/目标向量');ylabel('正弦波信号');
pq=con2seq(p);
a=sim(net,pq);
y=seq2con(a);
subplot(3,2,4);
plot(time,y{1},time,t,'r--');
xlabel('输入/目标向量');ylabel('正弦波调制信号');
%矩形波调制进行仿真
t=0.5*sign(sin(time));
p=(1+t).*cos(20*time);
subplot(3,2,5);
plot(time,p);
xlabel('输入/目标向量');ylabel('矩形波信号');
pq=con2seq(p);
a=sim(net,pq);
y=seq2con(a);
subplot(3,2,6);
plot(time,y{1},time,t,'r--');
xlabel('输入/目标向量');ylabel('矩形波调制信号');