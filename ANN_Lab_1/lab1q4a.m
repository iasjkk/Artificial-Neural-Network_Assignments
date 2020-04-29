clc;
clear all;

x1 =(100)*rand(50,1);
x2=(100)*rand(50,1);

y(x1>x2)=1;
y(x1<x2)=-1;

data=[x1 x2 y'];

k=1;
con=0.1;
w_old=[0.1 1 -1]';
data=[ones(size(data,1),1) data];
w_old=w_old/norm(w_old);
eta=1
m=1;
w=w_old;

while k>con && m<1000

   for i=1:size(data,1)
        net=w'*data(i,1:end-1)';
        y=sign(net);
        
        
        w=w+(eta*y*data(i,1:end-1)');
    end
   w=w/norm(w);
    k=norm(w-w_old)
    
    w_old=w;
    m=m+1;
end
w=w_old;


figure

scatter(data(data(:,4)==1,2),data(data(:,4)==1,3));
hold on;
scatter(data(data(:,4)==-1,2),data(data(:,4)==-1,3));
syms x;
fn=@(x) (-w(1)-w(2)*x)/w(3);

hold on;
fplot(fn,[0,100]);