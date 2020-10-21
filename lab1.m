[x,y]= meshgrid(-100:1:100, -100:1:100);
z = x.*y-25;
mesh(x,y,z);