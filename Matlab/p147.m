function p147
%BP神经网络算法改进：附加动量法
p=[-6.0 -6.1 -4.1 -4.0 5.0 -5.1 6.0 6.1];
t=[0 0 0.97 0.99 0.01 0.03 1.0 1.0];
[r,q]=size(p);
[s,q]=size(t);
disp('the bias b is fixed at 300 and will not learn')
z1=menu('initalize weight with:','w0=-0.9;b0=3;',...
    'pick values with mouse/arrow keys.',...
    'random inital condition[default].');
disp('');
b0=3;
w0=-rand(s,r);
if z1==1;
    w0=-0.9;
elseif z1==3
    w0=-rand(s,r);
end
error1=[];
net=newcf(minmax(p),1,{'logsig'});
net.b{1}=b0;
j=[-1:0.1:1];
for i=1:21
    net.iw{1,1}=j(i);
    y=sim(net,p);
    err=sumsqr(y-t);
    error1=[error1 err];
end
plot(j,error1);
xlabel('输入向量');ylabel('一维误差曲线');
title('附加动量法不同学习步长（lr）影响曲线');
hold on;
z2=menu('use momentium constant of:','0.0','input from key','0.95[default]');
if z1==2
    [w0,dummy]=ginput(1);
end
disp('')
if z2==1
    momentum=0;
elseif z2==2
   momentum=input('输入学习速率lr(0<lr<1):');
    while momentum<0|momentum>=1
        disp('please return input lr');
        momentum=input('输入学习速率lr(0<lr<1):');
    end
else
    momentum=0.95;
end
ls=[];error=[];w=[];
max_epoch=500;
err_goal=0.01;
lp.lr=0.05;lp.mc=momentum;
err_ratio=1.04;
W=w0;b=b0;
a=logsig(w0*p+b0*ones(1,8));
e=t-a;
sse=sumsqr(e);
for epoch=1:max_epoch
    if sse<err_goal
        epoch=epoch-1;
        break;
    end
    d=a.*(1-a).*e;
    gw=d*p';
    dw=learngdm([],[],[],[],[],[],[],gw,[],[],lp,ls);
    ls.dw=dw;
    tw=W+dw;
    ta=logsig(tw*p+b*ones(1,8));
    te=t-ta;
    tsse=sumsqr(te);
    if tsse>sse*err_ratio
        mc=0;
    elseif tsse<sse
        mc=momentum;
    end
    W=tw;a=ta;
    e=te;sse=tsse;
    error=[error tsse];
    w=[w W];
end
plot(w,error,'rp');
xlabel('输入向量');ylabel('随机权值变化曲线');
hold off;
figure;plot(error);
xlabel('输入向量');ylabel('训练误差曲线');