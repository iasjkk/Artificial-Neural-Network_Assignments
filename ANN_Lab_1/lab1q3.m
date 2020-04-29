clc;
clear all;
data=[1.0 -2.0 0.0 -1; 0.0 -1.5 -0.5 -1.0; -1.0 1.0 0.5 -1.0 ];
%data=[2 1  -1;0 -1 -1; ];

d=[-1  -1 1];
%d=[-1 1];
eta=0.1;

w_old=[1.0 -1.0 0.0 0.5]';
w_new=[1.0 -1.0 0.0 0.5]';

%w_old=[0 1 0]';
%w_new=[0 1 0]';
k=1;
con=0.000005;
temp=0;
m=1;
h=0;
while k>con && m<1000

   for i=1:size(data,1)
w_old=w_new;
       net(i)=w_old'*data(i,:)';
       
      y(i)=sign(net(i));
      
      r(i)=d(i)-y(i)
      w_new=w_old+(eta*(r(i))*data(i,:)');
      if r(i)==0
      h(i)=1;
      end
     
 
   end
   
   if sum(h)>=3
   break;
   end  
   
   k=norm(w_new-w_old)

   m=m+1;
end