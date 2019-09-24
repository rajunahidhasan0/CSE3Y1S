
clc;
close all;
clear all;
%x=[1 0 0 1 0 0 0 1 1 0 1 1 0 0 0 1];
x=[0 1 1 0 1 1 0 1];
T=length(x);
n=100;
bitrate=1;
N=2*n*T;
dt=T/N;
pulse=-2;
t=0:dt:T;
y=zeros(1,length(t));
  for i=0:(T-1);
         if x(i+1)==1
             if pulse==2
                 pulse=-2;
                 y(i*2*n+1 : (2*i+1)*n)=-1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             else
                 pulse=2;
                 y(i*2*n+1 : (2*i+1)*n)=-1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             end;
          else
             if pulse==2
                 pulse=-2;
                 y(i*2*n+1 : (2*i+1)*n)=1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             else
                 pulse=2;
                 y(i*2*n+1 : (2*i+1)*n)=1*pulse;
                 y((2*i+1)*n+1 : (2*i+2)*n)=pulse;
             end;
         end;
  end;
 
plot(t,y);
axis([0  t(end)  -3  3]);
grid on;
title('differential Manchester');