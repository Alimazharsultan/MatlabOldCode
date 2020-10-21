clc
clear
syms r h lambda;
v=pi.*r.^2.*h;
g = 2*pi.*r.^2 + 2*pi.*r.*h-88;
L = v + lambda.*(g);
Lr = diff(L,r);
Lh = diff(L,h);
Llambda = diff(L, lambda);
sol=solve([Lr,Lh,Llambda]);
r = sol.r(1)
h = sol.h(1)
lambda = sol.lambda(2)
answer=pi.*r.^2.*h
yo=fopen('lab02function5','w');
fprintf(yo,'Performance Index \t Constraint\n');
fprintf(yo,'v=pi.*r.^2.*h \t\t g = 2*pi.*r.^2 + 2*pi.*r.*h-88\n');
fprintf(yo, 'The required volume: %2.2f\n',double(answer));
clear r h;
syms r h;
[r,h] = meshgrid(-50:5:50);
fn=pi.*r.^2.*h;
contour(r,h,fn);
xlabel('x-axis');
ylabel('y-axis');
zlabel('fn value');
title('function contour plot');
