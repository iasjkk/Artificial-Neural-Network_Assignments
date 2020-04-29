data=[1.0 -2.0 1.5 0.0; 1.0 -0.5 -2.0 -1.5; 0.0 1.0 -1.0 1.5 ];

eta=1;

w_old=[1.0 -1.0 0.0 0.5]';

k=1;
con=0.1;
temp=0;
m=1;
w=w_old./norm(w_old);

nrm=01;



w_old=w;
it=1;
while k>con
w_old1=w_old;
for i=1:size(data,1)

    
    fwx=sign(w_old'*data(i,:)');


delw=eta*fwx*data(i,:)';

w_old=w_old+delw;
w_old=w_old./norm(w_old); 


end 

k=norm(w_old-w_old1);

m=m+1;
end