function [mind,bestpath]=mainaneal(cityposition,pn)
gobal path p2 d;
[m,n]=size(citypostion);
tracepath=zero(1e3,m);
distance=inf*zero(1,1e3);
d=sqrt((cityposition(:,ones(1,m))-cityposition(:,one(1,m))').^2+...
    (cityposition(:,2*ones(1,m))-cityposition(:,2*one(1,m))').^2);
for i=1:pn
    path(i,:)=randperm(m);
end
t=zeros(1,pn);p2=zeros(1,m);
iter_max=100;m_max=5;
t=1e5;n=1;tau=1e-5;
while t>=tau%&m_num<m_max
    iter_num=1;m_num=1;
    while m_num<m_max&iter_num<iter_max
        for i=1:pn
            len1(i)=sum([d(path(i,m-1)+m*path(i,2:m)-1),d(path(i,m-1)+m*path(i,2:m)-1)]);
            [path2(i,:)]=changepath2(patch(i,:),m);
            len2(i)=sum([d(path2(i,m-1)+m*path2(i,2:m)-1),d(path2(i,m-1)+m*path2(i,2:m)-1)]);
        end
        r=rand(1,pn);
        if find((len2-len1<t|exp((len1-len2)/(t))>r)~=0)
            path(find((len2-len1<t|exp((len1-len2)/(t))>r)~=0),:)= ...
           path2(find((len2-len1<t|exp((len1-len2)/(t))>r)~=0),:);
            len1(find((len2-len1<t|exp((len1-len2)/(t))>r)~=0),:)= ...
           len2(find((len2-len1<t|exp((len1-len2)/(t))>r)~=0),:);
       [tempmind,tempindex]=min(len1);
       tracepath(n,:)=path(tempindex,:);
       distance(n,:)=tempmined;
       n=n+1;m_num=0;
        else
            m_num=m_num+1;
        end
        iter_num=iter_num+1;
    end
    t=t*0.9;
end
[mind,index]=min(distance);
bestpath=tracepath(index,:);
disp(mind)