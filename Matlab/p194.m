function p194
%二元Hopfiedld神经网络进行仿真检验（有两个稳定平衡点）
t=[1 -1;-1 1];
plot(t(1,:),t(2,:),'rp');
axis([-1.1 1.1 -1.1 1.1]);
xlabel('a(1)');ylabel('a(2)');
net=newhop(t);
[y,pf,af]=net([],[],t);

a={rands(2,1)};
[y,pf,af]=net({20},{},a);
record=[cell2mat(a) cell2mat(y)];
start=cell2mat(a);
hold on;
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:));

color='rgbmy';
for i=1:25
    a={rands(2,1)};
    [y,pf,af]=net({20},{},a);
    record=[cell2mat(a) cell2mat(y)];
    start=cell2mat(a);
    plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1));
end
