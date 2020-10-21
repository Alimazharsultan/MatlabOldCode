clc
clear all
fs =100;
ts =1/fs;
dt =-2:ts:2-ts;
f1=10;
f2=30;
f3=70;

%y1 = 5*cos(2*pi*10*dt+pi/2);
%y1 = 1*sin(2*pi*1000*dt);
%y1 = fft(y1);
y1 = complex((2*exp(2*dt)).*(cos(2*pi*f1*dt)),(2*exp(2*dt)).*(sin(2*pi*f1*dt)));
y2 = 10*sin(2*pi*f2*dt);
y3 = 10*sin(2*pi*f3*dt);

subplot(3,1,1);
plot(dt,y1,'r');
subplot(3,1,2);
plot(dt,y2,'g');
subplot(3,1,3);
plot(dt,y3,'b');