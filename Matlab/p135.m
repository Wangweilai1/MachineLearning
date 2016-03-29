function p135
%假设传输信号为正弦波，噪声为白噪声，进行去噪滤波处理
tic,
time=0.01:0.01:10;
noise=(rand(1,1000)-0.5)*4;
t=sin(time);
input=t+noise;
net=newlin([-1 1],1,0,0.0005);
net.adaptparam.passes=70;
[net,y,output]=adapt(net,input,t);
hold on;
subplot(4,1,1);plot(time,input,'r');
ylabel('输入的混合信号');
subplot(4,1,2);plot(time,t,'m');
ylabel('目标信号');
subplot(4,1,3);plot(time,output,'b');
ylabel('实际输出信号');
e=t-output;
subplot(4,1,4);plot(time,e,'m');
xlabel('时间');ylabel('误差');
toc