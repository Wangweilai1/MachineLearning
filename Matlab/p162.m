function p162
%BP�������ڵ��̴�������ͳ�ơ�
tic,
load choles_all;
[pn,meanp,stdp,tn,meant,stdt]=prestd(p,t);
[ptrans,transmat]=prepca(pn,0.001);
[p,q]=size(ptrans);
iitst=2:4:q;
iival=4:4:q;
iitr=[1:4:q 3:4:q];
val.p=ptrans(:,iival);
val.t=tn(:,iival);
test.p=ptrans(:,iitst);
test.t=tn(:,iitst);
ptr=ptrans(:,iitr);
ttr=tn(:,iitr);
net=newff(minmax(ptr),[5,3],{'tansig','purelin'},'trainlm');
[net,tr]=train(net,ptr,ttr);
an=sim(net,ptrans);
a=poststd(an,meant,stdt);
for i=1:3
    figure(i)
    [m(i),b(i),r(i)]=postreg(a(i,:),t(i,:));
end
figure(4)
plot(tr.epoch,tr.perf,':',tr.epoch,tr.vperf,'-',tr.epoch,tr.tperf);
legend('ѵ���������','��֤�������','�����������');
ylabel('ƽ����'),xlabel('ʱ��');
pause

net=newff(minmax(ptr),[20,3],{'tansig','purelin'},'trainlm');
[net,tr]=train(net,ptr,ttr);
an=sim(net,ptrans);
a=poststd(an,meant,stdt);
for i=1:3
    figure(i)
    [m(i),b(i),r(i)]=postreg(a(i,:),t(i,:));
end
[m(1),b(1),r(1)]=postreg(a(1,:),t(1,:));
figure(4)
plot(tr.epoch,tr.perf,':',tr.epoch,tr.vperf,'-',tr.epoch,tr.tperf);
legend('ѵ�����������','��֤�������','�����������');
ylabel('ƽ����'),xlabel('ʱ��');
toc
