clc
clear
t - -1:0.01:1;
x = 2* sin(2*pi.*t);
plot(t,x,'r', 'LinWidth', 5);
grid on;
xlabel('t');
ylable('x(t)');
title('Sinusoidal Signal');