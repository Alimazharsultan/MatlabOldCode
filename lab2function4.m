clc
clear
syms x u lambda;
f = 0.5.*x.^2 + x.*u + u.^2 + u;
g = x - 3;
L = f + lambda.*(g);
Lx = diff(L,x);
Lu = diff(L,u);
Llambda = diff(L, lambda);
[lambda,u,x] = solve(Lx,Lu,Llambda);
yo=fopen('lab02function4','w');
answer = 0.5.*x.^2 + x.*u + u.^2 + u
fprintf(yo,'Performance Index \t\t\t\t Constraint\n');
fprintf(yo,'f = 0.5.*x.^2 + x.*u + u.^2 \t g = x - 3\n');
fprintf(yo, 'The required answer: %2.2f\n',double(answer));
clear x u;
syms x u;
[x,u] = meshgrid(-50:5:50);
fn=0.5.*x.^2 + x.*u + u.^2 + u;
contour(x,u,fn);
xlabel('x-axis');
ylabel('y-axis');
zlabel('fn value');
title('function contour plot');
