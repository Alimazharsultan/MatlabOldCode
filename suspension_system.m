clc
clear all
m1 = 240;
m2 = 60;
k1= 260;
d = 180;
k2 = 360;
s = tf('s');
p = 1/(m1*m2*s^4 + m1*d*s^3 + (m1*k1+m1*k2-d^2)*s^2 +2*d*k1*s +k1)  ;
kp = 5;
ki = 0;
kd = m1+m2;
c = pid(kp, ki, kd)
T = feedback(c*p,1);
t = 0:0.01:10;
step(T,t)