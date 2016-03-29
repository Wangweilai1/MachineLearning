function p129
%线性神经网络用于自适应系统识别
time1=0:0.05:4;
time2=4.05:0.5:6;
time=[time1 time2];
x=sin(sin(time).*time*10);
figure
plot(time,x);
xlabel('时间');ylabel('输入信号');
steps1=length(time1);
[t1,state]=filter([1 -0.5],1,x(1:steps1));
steps2=length(time2);
t2=filter([0.9 -0.6],1,x((1:steps2)+steps1),state);
t=[t1 t2];
figure
plot(time,t);
xlabel('时间');ylabel('输出信号');
t=con2seq(t);p=con2seq(x);lr=0.5;
delays=[0 1];
net=newlin(minmax(cat(2,p{:})),1,delays,lr);
[net,a,e]=adapt(net,p,t);
figure
plot(time,cat(2,a{:}),time,cat(2,t{:}),'--');
xlabel('时间');ylabel('输出-目标');
legend('网络输出','实际输出');
figure
plot(time,cat(2,e{:}),[min(time) max(time)],[0 0],':r');
axis([0 5 -2 2]);
xlabel('时间');ylabel('误差');