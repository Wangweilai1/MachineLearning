function p135
%���贫���ź�Ϊ���Ҳ�������Ϊ������������ȥ���˲�����
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
ylabel('����Ļ���ź�');
subplot(4,1,2);plot(time,t,'m');
ylabel('Ŀ���ź�');
subplot(4,1,3);plot(time,output,'b');
ylabel('ʵ������ź�');
e=t-output;
subplot(4,1,4);plot(time,e,'m');
xlabel('ʱ��');ylabel('���');
toc