file=fopen('lab02function3','w');
file=fopen('lab04','w');
    fprintf(file, 'Genetic Algorithms lab lab\n');
    fprintf(file, 'Starting conditions: \n');

syms x1 x2;
x1 = 5.601
x2 = 3.472
f = x1-x2 + 2*(x1^2)+ 2*x1*x2+ x2^2
F = 1*(1/(1+f))
x = rand()

