function p129
%������������������Ӧϵͳʶ��
time1=0:0.05:4;
time2=4.05:0.5:6;
time=[time1 time2];
x=sin(sin(time).*time*10);
figure
plot(time,x);
xlabel('ʱ��');ylabel('�����ź�');
steps1=length(time1);
[t1,state]=filter([1 -0.5],1,x(1:steps1));
steps2=length(time2);
t2=filter([0.9 -0.6],1,x((1:steps2)+steps1),state);
t=[t1 t2];
figure
plot(time,t);
xlabel('ʱ��');ylabel('����ź�');
t=con2seq(t);p=con2seq(x);lr=0.5;
delays=[0 1];
net=newlin(minmax(cat(2,p{:})),1,delays,lr);
[net,a,e]=adapt(net,p,t);
figure
plot(time,cat(2,a{:}),time,cat(2,t{:}),'--');
xlabel('ʱ��');ylabel('���-Ŀ��');
legend('�������','ʵ�����');
figure
plot(time,cat(2,e{:}),[min(time) max(time)],[0 0],':r');
axis([0 5 -2 2]);
xlabel('ʱ��');ylabel('���');