clc
clear all;
A(1,:)=[0 1 0 1 0];
B(1,:)=[1 0 0 1];
A(2,:)=[1 1 0 0 0];
B(2,:)=[0 1 0 1];

%%%%%conversion in to bipolar%%%%%%%%%%%%%%
A(A==0)=-1;

B(B==0)=-1;
 T=zeros(5,4);
for i=1:2
T=T+(A(i,:)'*B(i,:));

end
T=T-eye(5,4);



X1=A(1,:);

retreive1=sign(X1*T);

X2=[-1 1 1 1 -1];
X3=[-1 -1 1 1 -1];
retreive2=sign(X2*T);
retreive3=sign(X3*T);

for i=1:2
hd(i,1)=sum(retreive2-B(i,:));
hd(i,2)=sum(retreive3-B(i,:));
end

[min1 ind1]=min(hd(:,1));
[min2 ind2]=min(hd(:,2));


pattern1_obtain =B(ind1,:);
pattern2_obtain=B(ind2,:);


pattern1_obtain(pattern1_obtain<0)=0;
pattern2_obtain(pattern2_obtain<0)=0;

