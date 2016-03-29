function p270
a=[1 -1.7 0.7];
b=[1 0.5];
c=[1 0.2];
d=4;
na=length(a)-1;
nb=length(b)-1;
nc=length(c)-1;
nf=nb+d-1;
l=400;
uk=zeros(d+nb,1);
yk=zeros(na,1);
yrk=zeros(nc,1);
xik=zeros(nc,1);
yr=10*[ones(l/4,1);-ones(l/4,1);ones(l/4,1);ones(l/4+d,1)];
xi=sqrt(0.1)*randn(l,1);
[e,f,g]=sindiophantine(a,b,c,d);
for k=1:l
    time(k)=k;
    y(k)=-a(2:na+1)*yk+b*uk(d:d+nb)+c*[xi(k);xik];
    u(k)=(-f(2:nf+1)*uk(1:nf)+c*[yr(k+d:-1:k+d-min(d,nc));yrk(1:nc-d)]-g*[y(k);yk(1:na-1)])/f(1);
    for i=d+nb:-1:2
        uk(i)=uk(i-1);
    end
    uk(1)=u(k);
    for i=na:-1:2
        yk(i)=yk(i-1);
    end
    yk(1)=y(k);
    for i=nc:-1:2
        yrk(i)=yrk(i-1);
        xik(i)=xik(i-1);
    end
    if nc>0
        yrk(1)=yr(k);
        xik(1)=xi(k);
    end
end
subplot(2,1,1);plot(time,yr(1:l),'r:',time,y);
xlabel('k');ylabel('yr(k),y(k)');
legend('yr(k)','y(k)');
subplot(2,1,2);plot(time,u);
xlabel('k');ylabel('u(k)');