clc;
clear all;

data=[1 1 1 ;1 0 -1; 0  1 -1;0 0 -1;];



k=1;
con=0.001;
w_new=[0 0 0 ]';
data=[ones(size(data,1),1) data];

eta=0.1
m=1;


eta=0.01;
w_old=[0 0 0 ]';
w_new=[0 0 0]';

%w_old=[0 1 0]';
%w_new=[0 1 0]';
k=1;
con=0.001;
temp=0;
m=1;
h=0;

%for j=1:length(eta)
     
while k>con
w_new=w_old;
   for i=1:size(data,1)


       net=w_old'*data(i,1:end-1)';
       
    
      r(i)=data(i,end)-net;
    
   
      
      
      w_old=w_old+(eta*r(i)*data(i,1:end-1)');
      

   end
   
  
   
   k=norm(w_new-w_old);
  m=m+1;
      
       
end
 w=w_new;


figure

scatter(data(data(:,4)==1,2),data(data(:,4)==1,3));
hold on;
scatter(data(data(:,4)==-1,2),data(data(:,4)==-1,3));
%syms x;
fn=@(x) (-w(1)-w(3)*x)/w(2);

hold on;
fplot(fn,[-1,1]);
 