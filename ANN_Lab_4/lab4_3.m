clearvars;
fn=@(x,w)sign(w'*x);
clc;
x1=[1,-0.5,3,-2]; 
d=[1,-1,1,-1]';

x=[ones(4,1) x1']';

scatter(ones(4,1),x1);
hold on;

eta=1;
w=[0,0]';
tol=0.001;
nrm=1;
itr=1;
maxitr=1000;
while((nrm>tol) || (itr<=maxitr))
  wold=w;  
  for i=1:2
   w=w+eta*(d(i)-fn(x(:,i),w)).*x(:,i);  
  end
  
  itr=itr+1;
  nrm=norm(w-wold);
  
end

convergence=norm(w-wold);
fprintf('convergence=norm(w-wold)= %2.0f\n',norm(w-wold));

w
 
 y=w(1)+w(2)*x1;
 figure(1);
 plot(x1,y);
 
 figure(2);
 scatter(ones(4,1),x1);
 hold on;
 y=x(1,2)+x(2,2)*w;
 plot(w,y);

 figure(3);
 scatter(ones(4,1),x1);
 hold on;
 
 z1=x(1,1)+x(2,1)*w;
 plot(w,z1);
 hold on;

 z2=x(1,2)+x(2,2)*w;
 plot(w,z2);
 hold on;

 z3=x(1,3)+x(2,3)*w;
 plot(w,z3,'linewidth',5);
 hold on;
 
 z4=x(1,4)+x(2,4)*w;
 plot(w,z4,'linewidth',5);
 hold on;
 
 
%  sol_region =[-2;1;-1];
%  basevalue =-3;
%  area(sol_region,basevalue)
% 
% plot(x,y), hold on
% plot(x(a:b),y(a:b),'r','linewidth',3), hold off



