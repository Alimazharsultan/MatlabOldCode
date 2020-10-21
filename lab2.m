clear 
clc
syms x y;
f = x.^5 + y.^5 - 5.*x - 32.*y;
fx = diff(f,x) ;    %1st derivative
fxx = diff(fx,x);     %2nd derivative
fxy = diff(fx,y);
fy = diff(f,y);     %1st derivative
fyy = diff(fy,y);     %2nd derivative
xc = solve(fx);   %find critical points
yc = solve(fy);   %find critical points
sx1=subs(fxx,{x},{xc(1)});
sx2=subs(fxx,{x},{xc(2)});
sy1=subs(fyy,{y},{yc(1)});
sy2=subs(fyy,{y},{yc(2)});
H1 = [sx1 0 ; 0 sy1];
d1 = det(H1);
H2 = [sx2 0 ; 0 sy2];
d2 = det(H2);
yo=fopen('lab02function3','w');
if(sx1>0)
    fprintf(yo,'function is minima at x= %f\n', double(sx1));
else
    fprintf(yo,'function is maxima at x= %f\n', double(sx1));    
end
if(sx2>0)
    fprintf(yo,'function is minima at x= %f\n', double(sx2));
else
    fprintf(yo,'function is maxima at x= %f\n', double(sx2));    
end
fprintf(yo,'CP \t\t\t\t Fxx \t\t Fyy \n');
fprintf(yo, '(%2.2f %2.2f)\t\t %3.2f \t\t %3.2f \n',double(xc(1)),double(yc(1)), double(sx1), double(sy1));
fprintf(yo, '(%2.2f %2.2f)\t %3.2f \t %3.2f \n',double(xc(2)),double(yc(2)), double(sx2), double(sy2));
[x,y] = meshgrid(-50:5:50);
fn = x.^5 + y.^5 - 5.*x - 32.*y;
surf(x,y,fn);
xlabel('x-axis');
ylabel('y-axis');
zlabel('fn value');
title('fn = x.^5 + y.^5 - 5.*x - 32.*y surface plot');   