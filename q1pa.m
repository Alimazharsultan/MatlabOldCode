%Ali bin Mazhar
%160487
clc 
clear
syms t;
%question 2
%part a
f1 = 8*(t^2)*cos(3*t+(45*pi)/180);
h1 = laplace(f1);
h1
%part b
f2 = 3*t*exp(-2*t)*sin(4*t+(60*pi)/180);
h2 = laplace(f2);
h2
%question 3
%part a
syms s;
g1 = ((s^2+3*s+10)*(s+5))/((s+3)*(s+4)*(s^2+2*s+100));
ih1 = ilaplace(g1);
ih1
%part b
g2 = (s^3+4*s^2+2*s+6)/((s+8)*(s^2+8*s+3)*(s^2+5*s+7));
ih2 = ilaplace(g2);
ih2
%question 4
%part a
%the equation has been opened by hand
s = tf('s')
[r,p,k] = residue([0 0 0 0 0 10000 750000 250000],[1 113 4022 29875 350324 229500 3633750])
%part b
%matrix formed after solving the circuit
syms s Vs Vo Gs i1 i2 i3;
A = [4+4*s -2-4*s  -2;
    -4*s-2 10*s+14 -4+6*s;
    -2     -4+6*s  6+6*s+9/s];
B = [Vs;0;0];
A1= A;
A1(1:end,1) = B;
det(A1)
i1 = det(A1)/det(A)
A2 = A;
A2(1:end,2) = B;
i2 = det(A2)/det(A)
A3 = A;
A3(1:end,3) = B;
i3 = det(A3)/det(A)
Vo = i2*8;
%transfer function:
Gs = Vo/Vs
