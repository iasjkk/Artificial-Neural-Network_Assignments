clc;
clear all;
data=[1 1 1 ;1 -1 -1; -1  1 -1;-1  -1 -1;];



k=1;
con=0.001;
w_new=[0 0 0 ]';
data=[ones(size(data,1),1) data];

eta=0.1
m=1;
while(1)

   for i=1:size(data,1)
w_old=w_new;
       net(i)=w_old'*data(i,1:end-1)';
       
      y1(i)=sign(net(i)) ;
      
      
      r(i)=data(i,end)-y1(i);
      

      
      w_new=w_old+(eta*(r(i))*data(i,1:end-1)');
      if r(i)==0
      h(i)=1;
      end
     
 
   end
   
   if sum(h)>=4
   break;
   end  
   
   norm(w_new-w_old);

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