function p243
%分类问题，可以用来区分不同类别
p=[.5512 .5123 .5069 .5001 .6012 .5298 .5000 .4964 .5215 .5111 ;.4488...
    .4877 .4931 .4999 .3988 .4702 .5000 .5036 .4785 .4889];
plot(p(1,:),p(2,:),'rp');
xlabel('样本数据');ylabel('散点图');
hold on;
net=newsom([0 1;0 1],[3 4]);
w_init=net.iw{1,1};
figure;
plotsom(w_init,net.layers{1}.distances);
net=train(net,p);
w1=net.iw{1,1};
plotsom(w1,net.layers{1}.distances);
net.trainparam.epochs=500;
net=init(net);
net=train(net,p);
figure;
w1=net.iw{1,1};
plotsom(w1,net.layers{1}.distances);
y=sim(net,p);
vec2ind(y)
%测试示例
p=[0.55;0.45];
z=sim(net,p);
z=vec2ind(z)