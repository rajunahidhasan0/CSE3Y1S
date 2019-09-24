% AMI with Scrambling HDB3 technique

%         0000 -> 000V      0000 -> B00V
clc;
clear;
bitrate=2;
np=0;
x=[0 1 0 0 0 0 0 0 0 0 0 0 1 0 0];
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
             np++;
         elseif x(i+1)==2  
             y(i*n+1 : (i+1)*n)=pulse;   
              np++; 
         else
             if (mod(np,2)==0 && i+3<=T-1 && x(i+2)==0&&x(i+3)==0&&x(i+4)==0)         
                  y(i*n+1 : (i+1)*n)=-pulse;
                  pulse=-pulse;
                  np++;
                  x(i+2)=x(i+3)=0;
                  x(i+4)=2;               
             elseif (mod(np,2)==1 && i+3<=T-1 && x(i+2)==0&&x(i+3)==0&&x(i+4)==0)         
                  x(i+2)=x(i+3)=0;                 
                  x(i+4)=2;
             end;
         end;
   end;
   
plot(t,y);
axis([0 t(end) p-1 -p+1]);
grid on;
title('AMI with Scrambling B8ZS');
  
%Decoding
t=0:dt:T/bitrate;
np=0;
z=zeros(1,length(x));

   for i=1:n:length(y);
         if (y(i)==p)
             if(mod(np,2)+1==1 && (i+4*n<=length(y))&&((y(i)==p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==0 && y(i+4*n)==p)))
                y(i+n)=0; y(i+2*n)=0; y(i+3*n)=0;y(i+4*n)=0; z(((i-1)/n)+1)=1; np++; np++;
                
             elseif(mod(np,2)==0&&(i+3*n<=length(y))&&((y(i)==p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==p)))
                y(i+n)=0;y(i+2*n)=0;y(i+3*n)=0; np++;np++;
                
             else z(((i-1)/n)+1)=1; np++;
             end;
         elseif y(i)==-p
            if(mod(np,2)+1==1 &&(i+4*n<=length(y))&&((y(i)==-p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==0 && y(i+4*n)==-p)))
                y(i+n)=0; y(i+2*n)=0; y(i+3*n)=0;y(i+4*n)=0; z(((i-1)/n)+1)=1; np++;np++;
                
            elseif(mod(np,2)==0&&(i+3*n<=length(y))&&((y(i)==-p && y(i+n)==0 && y(i+2*n)==0 && y(i+3*n)==-p)))
                y(i+n)=0;y(i+2*n)=0;y(i+3*n)=0; np++;np++;
                
            else z(((i-1)/n)+1)=1; np++;
          end;
         end;       
   end;
  
z
  