%Scrambling HDB3
%0000----B00V
%   Wrong Code:                   Also need to work for 0000---000v
clc;
clear;

bitrate=1;
A=1;
pulse=-A;
x=[0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0];
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
        if(i+3<=T-1)
            if(x(i+2)==0 && x(i+3)==0 && x(i+4)==0)
                %y(i*n+1 : (i+1)*n)=1;
                if pulse==-1
                     y(i*n+1 : (i+1)*n)=-1;
                     pulse=1;
               else
                     y(i*n+1 : (i+1)*n)=1;
                     pulse=-1;
               end;
                x(i+2)= 0; x(i+3)= 0; x(i+4)= -2;
       
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
    if y((i-1)*200+1)==1
        if(i+3<=T)
            if(y((i)*200+1)==0 && y((i+1)*200+1)==0 && y((i+2)*200+1)==1)
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
