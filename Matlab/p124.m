function p124
p=1.0;
t=0.5;
w_range=-1:0.2:1;
b_rang=-1:0.2:1;
es=errsurf(p,t,w_range,b_rang,'purelin');
plotes(w_range,b_rang,es);
maxlr=maxlinlr(p,'bias');
net=newlin([-2 2],1,[0],maxlr);
net.trainparam.goal=1e-10;
net.trainparam.epoch=1;
net.trainparam.show=NaN;
h=plotep(net.iw{1},net.b{1},mse(t-sim(net,p)));
[net,tr]=train(net,p,t);
r=tr;
epoch=1;
while true
    epoch=epoch+1;
    [net,tr]=train(net,p,t);
    if length(tr.epoch)>1
        h=plotep(net.iw{1},net.b{1},tr.perf(2),h);
        r.epoch=[r.epoch epoch];
        r.perf=[r.perf tr.perf(2)];
        r.vperf=[r.vperf NaN];
        r.tperf=[r.tperf NaN];
    else
        break
    end
end
tr=r;
solvednet=newlind(p,t);
hold on
plot(solvednet.iw{1,1},solvednet.b{1},'ro')
hold off
plotperf(tr,net.trainparam.goal);
p=1.0;
a=sim(net,p);