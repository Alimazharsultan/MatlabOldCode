clc;
clear all;
%Ali bin Mazhar Sultan
%160487
file=fopen('Optimalcontrol','w');
    fprintf(file, 'Genetic Algorithms Lab\n');
    fprintf(file, 'Created by Ali bin Mazhar 160487\n');
N = 4;
k = [1:N+1];
initial = 2;
final = 6;
x = zeros(N+1,1);
x(1) = initial;
x(N+1) = final;
u = zeros(N,1);
a = 0.8;
b = 0.2;
sum_u_square = 0;
sum_uO_square = 0;
uO = zeros(N,1); 
xO = zeros(N,1);
xO(1)=initial;
xO(N+1) = final;
for i=1:1:N
    if(i==N)
         x(i+1) = final;
        u(i) = (x(i+1)-x(i)*a);
        u(i) = u(i)/b;
    end
    if(i<N)
   u(i) = (10-1).*rand(1,1) + 1;
    x(i+1) = (x(i) * a) + (u(i) * b);
    end
end

for i=1:1:N
    if(i>1)
    uO(i) = (1-a^2)/(b*(1-a^(2*N)));
    uO(i) = uO(i)*(x(N+1)-(a^(N))*x(1))*a^(N-i-1);
    xO(i) = (a^i)*x(1) + (x(N+1)- (a^(N))*x(1))*((1-a^(2*i))/(1-a^(2*N)))*a^(N-i);
    end
    if(i==1)
      uO(i) = (1-a^2)/(b*(1-a^(2*N)));
    uO(i) = uO(i)*(x(N+1)-(a^(N))*x(1))*a^(N-i-1);
    end
    
sum_uO_square = sum_uO_square + uO(i)^2;
end
u(N+1)=u(N);
uO(N+1)=uO(N);
for i=1:1:N
sum_u_square = sum_u_square + (u(i)).^2
end
axis equal
            plot(k, x, '-.ro');
            hold on
            plot(k, u, '-r+');
            hold on
            plot(k, xO, '-.b*');
            hold on
            plot(k, uO,'-.b+');
fprintf(file, '\nk\t\tu(k)\t\tx(k)\t\tu*(k)\t\tx*(k)\n');
 for i=1:1:N+1
 fprintf(file,'\n%1.0f\t\t%2.2f\t\t%2.2f\t\t%2.2f\t\t%2.2f\n', double(i), double(u(i)), double(x(i)), double(uO(i)), double(xO(i)));
end
fprintf(file, '\n\nJ = %2.4f', double(sum_u_square));
fprintf(file, '\n\nJ* = %2.4f', double(sum_uO_square));