function p314
%交通运输能力预测的matlab实例分析
p=[58478 135185 5.46 0.23 16.5 0.21 1005.3 585.44;67884 152369 5.46 0.27 18.7 0.26 1005.6 575.03;
    74462 182563 6.01 0.25 21.6 0.28 1204.6 601.23;78345 201587 6.12 0.26 25.8 0.29 1316.5 627.89;
    82067 225689 6.21 0.26 30.5 0.31 1423.5 676.95;89403 240568 6.37 0.28 34.9 0.33 1536.2 716.32;
    95933 263856 6.38 0.28 39.8 0.36 1632.2 765.24;104790 285697 6.65 0.30 42.5 0.39 1753.2 812.22;
    116694 308765 6.65 0.30 46.7 0.41 1865.5 875.26]';
t=[102569 52365 46251;124587 60821 56245;148792 69253 67362;162568 79856 98165;
    186592 91658 90548;205862 99635 98752;226598 109862 102564;
    245636 120556 111257; 263595 130378 120356]';
a=[1 2 3 5 7 8];
for i=1:6
    p(a(i),:)=(p(a(i),:)-min(p(a(i),:)))/(max(p(a(i),:))-min(p(a(i),:)));
end
for i=1:3
     t(i,:)=(t(i,:)-min(t(i,:)))/(max(t(i,:))-min(t(i,:)));
end
p_train=[p(:,1) p(:,2) p(:,3) p(:,4) p(:,5) p(:,6) p(:,7)];
t_train=[t(:,1) t(:,2) t(:,3) t(:,4) t(:,5) t(:,6) t(:,7)];
p_test=[p(:,8) p(:,9)];t_test=[t(:,8) t(:,9)];
for i=1:5
    net=newgrnn(p_train,t_train,i/10);
    temp=sim(net,p_train);
    j=3*i;
    y_out(j-2,:)=temp(1,:);
    y_out(j-1,:)=temp(2,:);
    y_out(j,:)=temp(3,:);
    temp=sim(net,p_test);
    y(j-2,:)=temp(1,:);
    y(j-1,:)=temp(2,:);
    y(j,:)=temp(3,:);
end
y1=[y_out(1,:);y_out(2,:);y_out(3,:)];
y2=[y_out(4,:);y_out(5,:);y_out(6,:)];
y3=[y_out(7,:);y_out(8,:);y_out(9,:)];
y4=[y_out(10,:);y_out(11,:);y_out(12,:)];
y5=[y_out(13,:);y_out(14,:);y_out(15,:)];
y6=[y(1,:);y(2,:);y(3,:)];
y7=[y(4,:);y(5,:);y(6,:)];
y8=[y(7,:);y(8,:);y(9,:)];
y9=[y(10,:);y(11,:);y(12,:)];
y10=[y(13,:);y(14,:);y(15,:)];
for i=1:7
    error1(i)=norm(y1(:,1)-t_train(:,i));
    error2(i)=norm(y2(:,1)-t_train(:,i));
    error3(i)=norm(y3(:,1)-t_train(:,i));
    error4(i)=norm(y4(:,1)-t_train(:,i));
    error5(i)=norm(y5(:,1)-t_train(:,i));
end
for i=1:2
    error6(i)=norm(y6(:,1)-t_test(:,i));
    error7(i)=norm(y7(:,1)-t_test(:,i));
    error8(i)=norm(y8(:,1)-t_test(:,i));
    error9(i)=norm(y9(:,1)-t_test(:,i));
    error10(i)=norm(y10(:,1)-t_test(:,i));
end
plot(1:7,error1,'-*');
hold on;
plot(1:7,error2,'-+');
hold on;
plot(1:7,error3,'-h');
hold on;
plot(1:7,error4,'-d');
hold on;
plot(1:7,error5,'-o');
xlabel('测试样本');ylabel('逼近误差');
hold off;
legend('')
figure;
plot(1:2,error6,'-*');
hold on;
plot(1:2,error7,'-+');
hold on;
plot(1:2,error8,'-h');
hold on;
plot(1:2,error9,'-d');
hold on;
plot(1:2,error10,'-o');
hold on;
xlabel('测试样本');ylabel('预测误差');
hold off;
legend('')