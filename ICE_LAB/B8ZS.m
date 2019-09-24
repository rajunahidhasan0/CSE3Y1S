%Scrambling B8ZS
%00000000----000VB0VB

clc;
clear;

bitrate=1;
A=1;
pulse=-A;
x=[0 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0];
T=length(x);
n=200;
N=n*T*bitrate;
dt=T/N;

%t=0:dt:T;
t=0:dt:T/bitrate;

y=zeros(1,length(t));
for i=0:T-1;
    if x(i+1)==1
           if pulse==-1
                 y(i*n+1 : (i+1)*n)=-1;
                 pulse=1;
           else
                 y(i*n+1 : (i+1)*n)=1;
                 pulse=-1;
           end;
    elseif x(i+1)==-2
            if pulse==-1
                 y(i*n+1 : (i+1)*n)=1;
                 pulse=-1;
           else
                 pulse=1;
                 y(i*n+1 : (i+1)*n)=-1;
           end;
    else
        if(i+7<=T-1)
            if(x(i+2)==0 && x(i+3)==0 && x(i+4)==0 && x(i+5)==0 && x(i+6)==0 && x(i+7)==0 && x(i+8)==0)
               %000VB0VB
                x(i+2)= 0; x(i+3)= 0;
                x(i+4)=-2; x(i+5)=1;
                x(i+6)=0;  x(i+7)=-2; x(i+8)=1;
            else y(i*n+1 : (i+1)*n)=0;
            end;
        else y(i*n+1 : (i+1)*n)=0;
        end;
     end;
end;

plot(t,y);
axis([0 t(end) -2 2]);
grid on;
title('Bipolar AMI');

%Decoding
pulse=-1;
z=zeros(1,length(x));
for i=1:T;
    if y((i-1)*200+1)==0
        if(i+7<=T-1)
            if(y((i)*200+1)==0 && y((i+1)*200+1)==0 && y((i+2)*200+1)==1 && y((i+3)*200+1)==-1 && y((i+4)*200+1)==0 && y((i+5)*200+1)==-1  && y((i+6)*200+1)==1 && y((i+7)*200+1)==0)
                z(i)=0;%z(i+1)=0;z(i+2)=0;z(i+3)=0;
                y((i+2)*200+1)=0;
            else z(i)=1;
            end; 
        else z(i)=1;
        end;
    elseif  y((i-1)*200+1)==-1
        if(i+3<=T-1)
            if(y((i)*200+1)==0 && y((i+1)*200+1)==0 && y((i+2)*200+1)==-1)
                z(i)=0;
                y((i+2)*200+1)=0;
            else z(i)=1;
            end;
        else z(i)=1;
        end;
    else z(i)=0;
    end
 end
z
