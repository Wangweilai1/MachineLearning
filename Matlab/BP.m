function BP
%BPѧϰ�㷨
%1��ʼ��������
l=0.05;n=30;cells=6;times=30000;
x=linspace(0,2*pi,n);
t=sin(x);w1=rand(cells,1)*0.05;
w2=rand(1,cells)*0.05;
yw1=rand(cells,1)*0.05;
yw2=rand*0.05;
y=rand(1,n)*0.05;
counts=1;
e=zeros(1,times);
%2ѧϰ����
for i=1:times
    ei=0;
    for a=1:n
      net1=w1*x(a)-yw1;
      out=logsig(net1);
      net2=w2*out-yw2;
      y(a)=net2;
      det2=t(a)-y(a);
      det1=((det2*(w2)').*out).*(1-out);
      w1=w1+det1*x(a)*l;
      w2=w2+(det2*out)'*l;
      yw1=-det1*l+yw1;
      yw2=-det2*l+yw2;
      ei=ei+det2^2/2;
      e(i)=ei;
    end
    if ei<0.008
        break;
    end
    counts=counts+1;
end
%ʾ��sin(x)�����ıƽ���
for a=1:n
     net1=w1*x(a)-yw1;
     out=logsig(net1);
     net2=w2*out-yw2;
     y(a)=net2;
end
subplot(2,1,1);
plot(x,t,'r--',x,y,'k*-');
grid on;
title('BPѧϰ�����ƽ� y=sin(x)');
%�������
if (counts<times)
    count=1:counts;
    sum=counts;
else
    count=1:times;
    sum=times;
end
subplot(2,1,2);
plot(count,e(1:sum));
disp('���������Ϊ��');
sum
title('BP �㷨ѧϰ�������');
xlabel('��������');ylabel('�������');
return;