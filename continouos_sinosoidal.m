clc
clear
t = 0:0.1:10;
%x = 1* cos(4*pi.*t+31*pi/4);
x = exp(3.*(-t))*4;
plot(t,x,'r', 'LineWidth', 1);
grid on;
xlabel('t');
ylabel('x(t) ');
title('Sinusoidal Signal');