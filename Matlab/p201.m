function p201
%Elman���������ڷ�ֵ�첨
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
xlabel('����/Ŀ������');ylabel('���ǲ��ź�');
pause
net.trainparam.epochs=500;
[net,tr]=train(net,pq,tq);
%���ǲ����ƽ��з���
time1=0:0.05:2*pi;
t1=time1/(2*pi)-0.5;
time2=2*pi:0.05:4*pi;
t2=1.5-time2/(2*pi);
time=[time1 time2];
t=[t1 t2];
p=(1+t).*cos(20*time);
subplot(3,2,1);
plot(time,p);
xlabel('����/Ŀ������');ylabel('���ǲ��ź�');
pq=con2seq(p);
a=sim(net,pq);
y=seq2con(a);
subplot(3,2,2);
plot(time,y{1},time,t,'r--');
xlabel('����/Ŀ������');ylabel('���ǲ������ź�');
%���Ҳ����ƽ��з���
t=0.5*sin(time);
p=(1+t).*cos(20*time);
subplot(3,2,3);
plot(time,p);
xlabel('����/Ŀ������');ylabel('���Ҳ��ź�');
pq=con2seq(p);
a=sim(net,pq);
y=seq2con(a);
subplot(3,2,4);
plot(time,y{1},time,t,'r--');
xlabel('����/Ŀ������');ylabel('���Ҳ������ź�');
%���β����ƽ��з���
t=0.5*sign(sin(time));
p=(1+t).*cos(20*time);
subplot(3,2,5);
plot(time,p);
xlabel('����/Ŀ������');ylabel('���β��ź�');
pq=con2seq(p);
a=sim(net,pq);
y=seq2con(a);
subplot(3,2,6);
plot(time,y{1},time,t,'r--');
xlabel('����/Ŀ������');ylabel('���β������ź�');