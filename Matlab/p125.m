function p125
p=[1 -1.2];
t=[0.5 1];
[r,q]=size(p);
[w,b]=size(t);
wrange=-2:0.2:2;
brange=-2:0.2:2;
es=errsurf(p,t,wrange,brange,'purelin');
mesh(es,[60,30]);
set(gcf,'color','w');
figure;
net=newlind(p,t);
dw=net.iw{1,1};
db=net.b{1};
[c,h]=contour(wrange,brange,es);
clabel(c,h);
colormap cool;
axis('equal');
hold on;
plot(dw,db,'rp','linewidth',2.5);
xlabel('w');ylabel('b');
lr=menu('选择学习速率： ','1.2*maxlinlr','2.8*maxlinlr');
disp(' ');
disp_freq=1;
max_epoch=28;
err_goal=0.001;
if lr==1
    lp.lr=1.2*maxlinlr(p,'bias');
else
    lp.lr=2.8*maxlinlr(p,'bias');
end
a=w*p+b;
A=purelin(a);
e=t-A;
sse=sumsqr(e);
erros=[sse];
for epoch=1:max_epoch
    if sse<err_goal
        epoch=epoch-1;
        break;
    end
    lw=w;lb=b;
    dw=learnwh([],p,[],[],[],[],e,[],[],[],lp,[]);
    db=learnwh(b,ones(1,q),[],[],[],[],e,[],[],[],lp,[]);
    w=w+dw;
    b=b+db;
    a=w*p+b;
    A=purelin(a);
    e=t-A;
    sse=sumsqr(e);
    erros=[erros sse];
    if rem(epoch,disp_freq)==0
        plot([lw,w],[lb,b],'g-');
        drawnow
    end
end
hold off;
figure;
m=w*p+b;
a=purelin(m);
plot(a);
xlabel('输入向量');ylabel('误差曲线');
