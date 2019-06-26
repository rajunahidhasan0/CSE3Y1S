% Bipolar AMI
clc;
clear;
bitrate=0.5;
x=[0 1 0 1 0 0 0 1 1 0 1 1 0 0 0 1];
T=length(x);
n=200;
N=n*T*bitrate;
dt=T/N;
p=pulse=-3;
t=0:dt:T/bitrate;
y=zeros(1,length(t));

   for i=0:T-1;
         if x(i+1)==1
             y(i*n+1 : (i+1)*n)=-pulse; 
             pulse=-pulse;  
         else
             y(i*n+1 : (i+1)*n)=0;
         end;
   end;
   
plot(t,y);
axis([0 t(end) p-1 -p+1]);
grid on;
title('Bipolar AMI');
  
%Decoding
t=0:dt:T/bitrate;
z=zeros(1,length(x));

   for i=0:T-1;
         if y((i*n)+1)~=0
             z(i+1)=1;
         end;
         
   end;
  
z
  