clearvars;
clc;

x1=[1,1,0,0]';
x2=[1,0,1,0]';

x=[x1 x2]

threshold=2;      
x2=~x2;
for i=1:size(x1,1)
  z1(i)=(x1(i)+ x2(i));
    if(z1(i)>=threshold)
     z1(i)=1;
    else  
     z1(i)=0;
    end
end
z1=z1'

x2=[1,0,1,0]';
x1=~x1;
for i=1:size(x1,1)
  z2(i)=(x2(i)+ x1(i));
    if(z2(i)>=threshold)
     z2(i)=1;
    else  
     z2(i)=0;
    end
end
z2=z2'

threshold=1;     
  for i=1:size(x1,1)
    y(i)=(z1(i)+ z2(i));
      if(y(i)>=threshold)
       y(i)=1;
      else  
       y(i)=0;
      end
  end
  
  Y_output=y'