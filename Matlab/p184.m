function p184
%应用概率神经网络PNN进行变量分类
p=[1 2;2 2;1 1]';
tc=[1 2 3];
plot(p(1,:),p(2,:),'r.','markersize',30);
for i=1:3
    text(p(1,:)+0.1,p(2,:),sprintf('class % g',tc(i)));
end
axis([0 3 0 3]);
xlabel('p(1,:)');ylabel('p(2,:)');
t=ind2vec(tc);
spread=1;
net=newpnn(p,t,spread);
a=sim(net,p);
ac=vec2ind(a);
plot(p(1,:),p(2,:),'r.','markersize',30);
axis([0 3 0 3]);
for i=1:3
    text(p(1,:)+0.1,p(2,:),sprintf('class % g',ac(i)));
end
xlabel('p(1,:)');ylabel('p(2,:)');
%
p=[2;1.5];
a=sim(net,p);
ac=vec2ind(a);
hold on
plot(p(1,:),p(2,:),'r.','markersize',10,'color',[1 0 0]);
text(p(1)+0.1,p(2),sprintf('class % g',ac));
hold off;
xlabel('p(1,:) 与p(1)');ylabel('p(2,:)与p(2)');
p1=0:0.05:3;
p2=p1;
[p1,p2]=meshgrid(p1,p2);
pp=[p1(:),p2(:)]';
aa=sim(net,pp);
aa=full(aa);
m=mesh(p1,p2,reshape(aa(1,:),length(p1),length(p2)));
set(m,'facecolor',[0 0.5 1],'linestyle','none');
hold on;
m=mesh(p1,p2,reshape(aa(2,:),length(p1),length(p2)));
set(m,'facecolor',[0 0.1 0.5],'linestyle','none');
m=mesh(p1,p2,reshape(aa(3,:),length(p1),length(p2)));
set(m,'facecolor',[0.5 0 1],'linestyle','none');
plot3(p(1,:),p(2,:),[1 1 1]+0.1,'.','markersize',30);
plot3(p(1),p(2),1.1,'*','markersize',10,'color',[1 0 0]);
hold off
view(2)
xlabel('p(1,:) 与p(1)');ylabel('p(2,:)与p(2)');
set(gcf,'color','w');