function p167
%模式识别A——Z加入随机信号然后进行去噪处理从而得到基准信号
tic,
[alphabet,targets]=prprob;
s1=12;
[r,q]=size(alphabet);
[s2,q]=size(targets);
p=alphabet;
net=newff(minmax(p),[s1,s2],{'logsig','logsig'},'traingdx');
net.lw{2,1}=net.lw{2,1}*0.01;
net.b{2}=net.b{2}+0.01;
%无噪声训练
t=targets;
net.performfcn='sse';
net.trainparam.goal=0.1;
net.trainparam.show=20;
net.trainparam.epoch=5000;
net.trainparam.mc=0.95;
[net,tr]=train(net,p,t);
%有噪声训练
netn=net;
netn.trainparam.goal=0.6;
netn.trainparam.epoch=300;
t=[targets targets targets targets];
for pass=1:10
    p=[alphabet,alphabet,(alphabet+randn(r,q)*0.1),(alphabet+randn(r,q)*0.2)];
    [netn,tr]=train(net,p,t);
end
%再次无噪声训练，为了使得网络进行理想信号识别时，节约资源
netn.trainparam.goal=0.1;
netn.trainparam.epoch=500;
netn.trainparam.show=5;
p=alphabet;
t=targets;
[netn,tr]=train(netn,p,t);
%系统性能
noise_range=0:0.05:0.5;
max_test=100;
network1=[];
network2=[];
t=targets;
for noiselevel=noise_range
    errors1=0;
    errors2=0;
    for i=1:max_test
        p=alphabet+randn(35,26)*noiselevel;
        a=sim(net,p);
        aa=compet(a);
        errors1=errors1+sum(sum(abs(aa-t)))/2;
        an=sim(netn,p);
        aan=compet(an);
        errors2=errors2+sum(sum(abs(aan-t)))/2;
    end
    network1=[network1 errors1/26/100];
    network2=[network2 errors2/26/100];
end
plot(noise_range,network1*100,'--',noise_range,network2*100);
xlabel('噪声指标');ylabel('无噪声训练网络-- 有噪声训练网络-');
legend('无噪声训练网络','有噪声训练网络');
save li167 net;
%测试该神经网络
 k=0;
 i=27;
 b(i)=0;
for i=1:26
    noisyj=alphabet(:,i)+randn(35,1)*0.2;
    %figure;plotchar(noisyj);
    a2=sim(net,noisyj);
    a2=compet(a2);
    answer=find(compet(a2)==1);
    %figure;plotchar(alphabet(:,answer));
    if((i)==mod(answer,26))
        b(i)=i;
        k=k+1;
    end
end
disp('正确输出第n个字母');
b
disp('共输出正确字母数为');
k
toc