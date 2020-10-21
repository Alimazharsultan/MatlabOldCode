%Ali bin Mazhar 160487 Sec A
clc
clear
%step1 grid cordinates (input data)
xc = 4;  %current position x coordinate
yc = 3;     %current position y coordinates
xo= 4.5;    %obstacle x coordinates
yo=4;       %obstacle y coordinates
xt=5;       %goal x coordinates
yt=5;       %goal y coordinates
distance_travled = 0;
totaldistance = 0;
%define stepsize 
ct=0.4*(sqrt((xc-xo)^2+(yc-yo)^2)); %i.e. (0.4*Distance between MR and Obstacle) or a fraction of sensor range 
%number of points
NPTS = 5; 
straightline = sqrt((xc-xt)^2+(yc-yt)^2);
file=fopen('lab04','w');
    fprintf(file, 'andom Particle optimization lab\n');
    fprintf(file, 'Starting conditions: \n');
    fprintf(file, 'Created by Ali bin Mazhar 160487\n');
    fprintf(file, 'Current position (xc, yc) = (4, 3)\n');
    fprintf(file, 'Obstacle position (xo, yo) = (4.5, 4)\n');
    fprintf(file, 'Goal position (xt, yt) = (5, 5)\n');
    fprintf(file, 'Stepsice Ct = 0.447\n');
      fprintf(file, 'Straight line distance = %f\n', double(straightline));
count = 1;
xpoints(1) = xc;
ypoints(1) = yc;
while(count ~=0)
    %stepsize angle will be 360/6 = 60 or pi/3
    for i=1:1:NPTS
       theta(i) = (i-1)*(360/NPTS); 
    end
    % theta(1) = 20;  
    % theta(2) = 45;  
    % theta(3) = 58;  
    % theta(4) = 92; 
    % theta(5) = 145;    
    % theta(6) = 193;    
    % theta(7) = 210;
    % theta(8) = 220;
    % theta(9) = 293;
    % theta(10) = 340;
    JobstC = exp(-4*((xc-xo)^2+(yc-yo)^2));    %current position to obstacle potential
    JgoalC = -exp(-4*((xc-xt)^2+(yc-yt)^2));    %current position to goal potential
    JtC = JobstC + JgoalC;      %total potential
    Dtg = sqrt((xc-xt)^2+(yc-yt)^2);
    %for loop from one to the number of points
    for i=1:1:NPTS
        x(i) = xc + ct*cos((theta(i)*pi)/180);    %x coordinates for artificial points
        y(i) = yc + ct*sin(theta(i)*pi/180);   %y coordinates for artificial points
        Jobst(i) = exp(-4*((x(i)-xo)^2+(y(i)-yo)^2));   %artificial point to obstacle potential
        Jgoal(i) = -exp(-4*((x(i)-xt)^2+(y(i)-yt)^2));  %artificial point to goal potential
        Jt(i) = Jobst(i)+Jgoal(i);              %total potential
        DistTOGoal(i) = sqrt((xt-x(i))^2+(yt-y(i))^2); %distance to goal from the artificial point
        costerror(i) = Jt(i)-JtC ;        %error between current posistion potential and artificial point potenial
        disterror(i) = DistTOGoal(i)-Dtg;  %error between current posistion distance to goal and artificial point distance to goal
    end
    plot(x,y, '-.g^', 'Linewidth', 2);
    hold on
    %code for writing in text file
    fprintf(file, '\nFor alteration number: %f, for current position x= %f and y = %f\n', count, double(xc), double(yc));
    fprintf(file,'\nIndex \t theta \t\t x(i)\t\ty(i)\tJosbt(i)\tJgoal(i)\tTotat J(i)\t\tDistance to goal\tCosterror(i)\tDisterror(i)\n');
    %for loop to print the table
    for k=1:1:NPTS
        fprintf(file, '%d\t\t%3.3f\t\t%3.3f\t\t%3.3f\t%3.3f\t\t%3.3f\t\t%3.3f\t\t\t%3.3f\t\t\t\t%3.3f\t\t\t%3.3f\n',k,double(theta(k)), double(x(k)), double(y(k)), double(Jobst(k)), double(Jgoal(k)), double(Jt(k)),DistTOGoal(k), double(costerror(k)), double(disterror(k)));
    end
        L=0;
    sDE = disterror(1);
    sCE = costerror(1);
    for i=1:1:NPTS
        if((costerror(i) < 0)&&(disterror(i)< 0))
            if(costerror(i)<= sCE)
                sCE = costerror(i);
                L=i;
            end
        end
    end
    if(L==0)
          sDE = disterror(1);
          sCE = costerror(1);
        for i=1:1:NPTS
                if(disterror(i)<=sDE)
                sDE = disterror(i);    
                    L = i;
                end
        end
    end
    
   distance_travled = (sqrt(((xc-x(L))^2)+(yc-y(L))^2));
   totaldistance = totaldistance +distance_travled;
   fprintf(file,'\nThe best point is at point x=%f, y=%f , index= %f, distance traveled to best point = %f\n', double(x(L)), double(y(L)), double(L), double(distance_travled));
   xc = x(L);
        yc = y(L);
        xpoints(count+1) = xc
    ypoints(count+1) = yc
     if((abs((xt-xc))<0.1) && (abs((yt-yc))<0.1))
          count = 0;
          fprintf(file,'\nThe MR is almost at the target. And total distance traveled = %f cm. Straight line distance = %f cm', double(totaldistance), double(straightline) );
          
            axis equal
            plot(xo, yo, '-.ro');
            hold on

          plot(xpoints,ypoints,'-b+');
          hold on
          plot(xt, yt, '-.r*')
            
     else
        count = count +1; 
     end
end


    
