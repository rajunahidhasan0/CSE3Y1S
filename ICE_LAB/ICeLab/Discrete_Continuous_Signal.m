
clear;

A=1;
T=3;
th=22;

%Discrete
F=1;
fs=20;

sn=0: 1/fs: T;

y=A*cos(2*pi*sn*F + th);

subplot(2,1,1);
stem(sn, y,'b');

%Continuous

F2=1/T;

t=0: 1/fs: T;

y2=A*cos(2*pi*t*F + th);

subplot(2,1,2);
plot(t, y2, 'r')