clc
clear all
s = tf('s');
P = 1/(s^2+10*s+20);
Kp = 30;
Ki = 70; 
C = pid(Kp,Ki) 
T = feedback(C*P,1) 
 
t = 0:0.01:2;
step(T,t)
