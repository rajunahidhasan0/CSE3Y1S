%code for Manchester signal

clc;
clear;
%x=[0 1 0 1 0 0 0 1 1 0 1 1 0 0 0 1];
x=[1 0 0 1 1 1 0 0]
T=length(x);
n=100;
bitrate=1;
N=2*n*T;
dt=T/N;
t=0:dt:T;
y=zeros(1,length(t));
    for i=0:1:(T-1);
        if x(i+1)==1
            y(i*2*n+1 : (2*i+1)*n)=-1;
            y((i*2+1)*n+1 : (2*i+2)*n)=1;
        else
            y(i*2*n+1 : (2*i+1)*n)=1;
            y((2*i+1)*n+1 : (2*i+2)*n)=-1;
        end;
    end;
plot(t,y);
axis([0 t(end) -2 2]);
grid on;
title('Manchester');
