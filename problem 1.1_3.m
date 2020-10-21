[x,y]=meshgrid(-3:1:3; -3:1:3);
z = x.*2+y.*2;
mesh(x,y,z);