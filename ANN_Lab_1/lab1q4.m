clc;
clear all;

x1 =(1000)*rand(500,1);
x2=(1000)*rand(500,1);

y(x1>x2)=1;
y(x1<x2)=-1;

data=[x1 x2 y'];

k=1;
con=0.01;
w_new=[0 0 0]';
data=[ones(size(data,1),1) data];

eta=0.1
m=1;
while k>con && m<1000

   for i=1:size(data,1)
w_old=w_new;
       net(i)=w_old'*data(i,1:end-1)';
       
      y1(i)=sign(net(i));
      
      r(i)=data(i,end)-y1(i);
      w_new=w_old+(eta*(r(i))*data(i,1:end-1)');
      if r(i)==0
      h(i)=1;
      end
     
 
   end
   
   if sum(h)>=3
   break;
   end  
   
   k=norm(w_new-w_old);

   m=m+1;
end
w=w_new;
figure

scatter(data(data(:,4)==1,2),data(data(:,4)==1,3));
hold on;
scatter(data(data(:,4)==-1,2),data(data(:,4)==-1,3));
syms x;
fn=@(x) (-w(1)-w(2)*x)/w(3);

hold on;
fplot(fn,[0,1000]);