clc;
clear all;
%data=randi([1,10],100,2);
 x1=[1 2  4 5]';
 x2=[4 3  1 2]';
%data=[2 1  -1;0 -1 -1; ];
 data=[x1 x2];
d=(data(:,1)+data(:,2))';
%data=zscore(data)
%d=[-1 1];
%eta=0.1:0.1:1;
eta=0.01;
w_old=[0 0 ]';
w_new=[0 0]'

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


       net=w_old'*data(i,:)';
       
    
      r=d(i)-net;
    data(i,:);
     
      r*data(i,:)';

      
      
      w_old=w_old+(eta*r*data(i,:)');
   end
       
  
   
   k=norm(w_new-w_old)
  m=m+1;
      
       
end
 
 %w_a(:,j)=w_new 

%end