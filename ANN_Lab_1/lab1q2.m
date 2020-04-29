
data=[1.0 -2.0 1.5 0.0; 1.0 -0.5 -2.0 -1.5; 0.0 1.0 -1.0 1.5 ];

eta=1;

w_old=[1.0 -1.0 0.0 0.5]';
w_new=[1.0 -1.0 0.0 0.5]';
k=1;
con=0.05;
temp=0;
m=1;


w_new=w_new/norm(w_new);
while k>con && m<1000

for i=1:size(data,1)
w_old=w_new;
    l=exp(-(w_old'*data(i,:)'));
    fwx=(2/(1+l))-1;


delw=eta*fwx*data(i,:)';

w_new=w_old+delw;
%w_new=w_new./norm(w_new);

if norm(w_new-w_old)==0
2
    temp=1;
end
w_new=w_new./norm(w_new);
end

k=norm(w_new-w_old);


if temp==1;
1
break;
end


m=m+1;
w_old=w_new;
end