function p361
%�����Զ��������硣
net=network;
%��һ�����ṹ����
%����������Ŀ2���������3
net.numinputs=2;
net.numlayers=3;
%��ֵ��������
net.biasconnect(1)=1;
net.biasconnect(3)=1;
%������������
net.inputconnect=[1 0;1 1;0 0];
%����������
net.layerconnect=[0 0 0;0 0 0;1 1 1];
%�����������
net.outputconnect=[0 1 1];
%�ڶ������Ӷ�������
net.inputs{1}.range=[0 12;0 12];
net.inputs{2}.range=[-1 3;-1 3;-1 3;-1 3;-1 3];
net.layers{1}.size=4;
net.layers{1}.transferfcn='tansig';
net.layers{1}.initfcn='initnw';
net.layers{2}.size=3;
net.layers{2}.transferfcn='logsig';
net.layers{2}.initfcn='initnw';
net.layers{3}.initfcn='initnw';
net.inputweights{2,1}.delays=[0 1];
net.inputweights{2,2}.delays=1;
net.layerweights{3,3}.delays=1;
net.initfcn='initlay';
net.performfcn='mse';
net.trainfcn='trainlm';
net=init(net);
net.iw{1,1}
p={[0;0] [2;0.5];[2;-2;1;0;1] [-1;-1;1;0;1]};
t={-1 1};
y=sim(net,p)
net.trainparam
net.trainparam.goal=1e-9;
%net=train(net,p,t)
