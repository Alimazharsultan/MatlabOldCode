clc
clear all
num = [5];
den = [1560.25 520.01 0];
h = tf(num, den)
t = 0:0.1:100;
step(h,t)
hold on