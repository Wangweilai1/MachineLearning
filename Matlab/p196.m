function p196
%三元Hopfiedld神经网络进行仿真检验（有两个稳定平衡点）
t=[1 1;-1 1;-1 -1];
axis([-1 1 -1 1 -1 1]);
set(gca,'box','on');axis manual;
hold on;
plot3(t(1,:),t(2,:),t(3,:),'ro');
xlabel('a(1)');ylabel('a(2)');zlabel('a(3)');
view([37.5 30]);
net=newhop(t);

a={rand(3,1)};
[y,pf,af]=net({1 10},{},a);
record=[cell2mat(a) cell2mat(y)];
start=cell2mat(a);
hold on;
color='rgbmy';
for i=1:25
    a={rands(3,1)};
    [y,pf,af]=net({1 10},{},a);
    record=[cell2mat(a) cell2mat(y)];
    start=cell2mat(a);
    plot3(start(1,1),start(2,1),start(3,1),'bp',record(1,:),record(2,:),record(3,:),color(rem(i,5)+1));
end
pause
%伪稳定平衡点
p=[1.0 -1.0 -0.5 1.00 1.00 0.0;...
    0.0 0.0 0.0 0.00 0.00 -0.0;...
    -1.0 1.0 0.5 -1.01 -1.00 0.0];
cla
plot3(t(1,:),t(2,:),t(3,:),'ro');
net=newhop(t);
color='rgbmy';
for i=1:6
    a={p(:,i)};
    [y,pf,af]=net({1 10},{},a);
    record=[cell2mat(a) cell2mat(y)];
    start=cell2mat(a);
    plot3(start(1,1),start(2,1),start(3,1),'gp',record(1,:),record(2,:),record(3,:),color(rem(i,5)+1));
end
