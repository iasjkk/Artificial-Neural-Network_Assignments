clc;
clear all;
data=[0.8 0.5 0; 0.9 0.7 0.3;1 0.8 0.5;0 0.2 0.3; 0.2 0.1 1.3;0.2 0.7 0.8];
%data=[2 1  -1;0 -1 -1; ];

d=[1 1 1 -1 -1 -1];
%d=[-1 1];
eta=0.1:0.1:1;
%eta=1;
w_old=[0 0 0]';
w_new=[0 0 0]';

%w_old=[0 1 0]';
%w_new=[0 1 0]';
k=1;
con=0.0001;
temp=0;
m=zeros(10,1);
h=0;

for j=1:length(eta)
    
w_old=[0 0 0]';
w_new=[0 0 0]';
   k=1; 
while k>con 

   for i=1:size(data,1)
w_old=w_new;


       net(i)=w_old'*data(i,:)';
         l=exp(-net(i));
    y(i)=(2/(1+l));
    y(i)=y(i)-1;
    
    
    fdash_w=0.5*(1-(y(i).^2));
   
      
      r(i)=d(i)-y(i);
      w_new=w_old+(eta(j)*(r(i))*fdash_w*data(i,:)');
      if r(i)==0
      h(i)=1;
      end
 
   end
   
   if sum(h)>=6
   break;
   end
   
   k=norm(w_new-w_old);
  
       m(j)=m(j)+1;
       
end
 
 w_a(:,j)=w_new 

end