function p128
%��������������ϵͳʶ��
time=0:0.25:5;
x=sin(sin(time).*time*10);
figure
plot(time,x);
xlabel('ʱ��');ylabel('�����ź�');
q=size(x,2);
p=size(3,q);
p(1,1:q)=x(1,1:q);
p(2,2:q)=x(1,1:(q-1));
p(3,3:q)=x(1,1:(q-2));
t=filter([1 0.5 -1.5],1,x);
figure
plot(time,t);
xlabel('ʱ��');ylabel('����ź�');
net=newlind(p,t);
a=sim(net,p);
figure
plot(time,a,time,t,'rp');
xlabel('ʱ��');ylabel('���-Ŀ��');
legend('�������','ʵ�����');
e=t-a;
figure
plot(time,e);
axis([0 5 -2 2]);
xlabel('ʱ��');ylabel('���');

