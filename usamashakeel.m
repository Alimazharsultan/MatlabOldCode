clc
clear all
n = [1];
d =  [20012.5 425 200];
y = tf(n,d)
step(y)
hold on