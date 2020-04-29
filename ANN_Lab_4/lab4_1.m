clearvars;
clc;

x1=[1,1,0,0]';
x2=[1,0,1,0]';
prompt = 'Press 1 for "AND(Binary i/p)"\nPress 2 for "OR(Binary i/p)"\nPress 3 for "AND NOT(Binary i/p)"\n';
choice=input(prompt);

x=[x1 x2]

if choice==1
   threshold=2      
   for i=1:size(x1,1)
    y(i)=(x1(i)+ x2(i));
   if(y(i)>=threshold)
     y(i)=1;
   else  
     y(i)=0;
   end
   end
   
 elseif choice==2
   threshold=1      
   for i=1:size(x1,1)
    y(i)=(x1(i)+ x2(i));
   if(y(i)>=threshold)
     y(i)=1;
   else  
     y(i)=0;
   end
   end
     
elseif choice==3
   threshold=2      
   x2=~x2;
   for i=1:size(x1,1)
    y(i)=(x1(i)+ x2(i));
   if(y(i)>=threshold)
     y(i)=1;
   else  
     y(i)=0;
   end
   end
   
end

y=y'
