clear all;
clc;
X=[1 -1  1 -1 1 -1 1 -1 1 -1  1 -1  1 -1 1 ;
    1 1 -1 -1 1 1 -1 -1 1 1 -1 -1  1 1 -1;
    1 1 1 -1 -1 -1 1 1 1 -1 -1 -1 1 1 1;
    1 1 1 1 -1 -1 -1 -1 1 1 1 1 -1 -1 -1 ;];
Y=[1 1 1 1 -1 -1 -1 -1 1 1;
    1 1 1 -1 -1 -1 1 1 1 -1;
    1  1 -1 -1 1 1 -1 -1 1 1;
    1 -1 1 -1 1 -1  1 -1 1 -1;];
    

T=zeros(15,10)
for i=1:3
T=T+(X(i,:)'*Y(i,:));

end


T=T-(eye(15, 10));


probe=X(1,:);



beta=probe*T;
for i=1:3
alpha=T*beta';

beta=alpha'*T

end


for i=1:3
hd(i,1)=sum(beta-Y(i,:));
end


[min_val, ind]=min(hd);
beta=Y(ind,:);


beta(beta==0)=probe(beta==0);

beta=sign(beta);

