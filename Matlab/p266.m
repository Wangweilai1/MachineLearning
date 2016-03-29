function p266
w=rands(18,2)/2+0.5;
v=rands(5,18)/2+0.5;
p=[0 0;0.5 0.5;0 0.5;1 1;0.5 1;1 0.5];
t=[1 0 0 0 0;1 0 0 0 0;0 1 0 0 0;0 0 1 0 0;0 0 0 1 0;0 0 0 0 1];
t_out=t;
epoch=1000;
for i=1:6
    if p(i,:)==[0 0];
        p(i,:)=p(i,:);
    else
        p(i,:)=p(i,:)/norm(p(i,:));
    end
end
while epoch>0
    for j=1:6
        for i=1:8
            w(i,:)=w(i,:)/norm(w(i,:));
            s(i)=p(j,:)*w(i,:)';
        end
        temp=max(s);
        for i=1:8
            if temp==s(i)
                count=i;
            end
            for i=1:8
                s(i)=0;
            end
            s(count)=1;
            w(count,:)=w(count,:)+0.1*[p(j,:)-w(count,:)];
            w(count,:)=w(count,:)/norm(w(count,:));
            v(:,count)=v(:,count)+0.1*(t(j,:)'-t_out(j,:)');
            t_out(j,:)=v(:,count)';
        end
        epoch=epoch-1;
    end
end
    t_out
    pc=[0.5 1;1 1];
    for i=1:2
    if pc(i,:)==[0 0];
        pc(i,:)=pc(i,:);
    else
        pc(i,:)=pc(i,:)/norm(pc(i,:));
    end
    end
    outc=[0 0 0 0 0;0 0 0 0 0];
    for j=1:2
        for i=1:18
            sc(i)=pc(j,:)*w(j,:)';
        end
        tempc=max(sc);
        for i=1:18;
            if tempc==sc(i)
                countp=i;
            end
            sc(i)=0;
        end
        sc(countp)==1;
        outc(j,:)=v(:,countp)';
    end
    outc       