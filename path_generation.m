%Genetic Algorithm
clear all
clc
%Fixing Random Number
% RandStream.setGlobalStream(RandStream('mcg16807','Seed',0))
%*************************************************************************
%*************************************************************************
%*************************************************************************
%Enter Envirement Data
NPTS=16;            %number of points
NOBS=7;     %number of obstacles
X_co=[1 1 3 3 5 6 6 8 10 10 10 11 13 12 14 14]; %xcoordinates of points
Y_co=[7 11 14 1 8 11 4 4 1 7 11 14 12 2 3 8];   %ycoordinates of points
S_OL=[3 2 3 3 3 3 3 3 2 3 3 3 2 4 2 4];     %number of links for each point
%distance between link connections
L(01,01)=02;L(01,02)=04;L(01,03)=05;
L(02,01)=01;L(02,02)=03;
L(03,01)=02;L(03,02)=06;L(03,03)=12;
L(04,01)=01;L(04,02)=07;L(04,03)=09;
L(05,01)=01;L(05,02)=06;L(05,03)=07;
L(06,01)=03;L(06,02)=05;L(06,03)=11;
L(07,01)=04;L(07,02)=05;L(07,03)=08;
L(08,01)=07;L(08,02)=10;L(08,03)=14;
L(09,01)=04;L(09,02)=14;
L(10,01)=08;L(10,02)=11;L(10,03)=16;
L(11,01)=06;L(11,02)=10;L(11,03)=12;
L(12,01)=03;L(12,02)=11;L(12,03)=13;
L(13,01)=12;L(13,02)=16;
L(14,01)=08;L(14,02)=09;L(14,03)=15;L(14,04)=16;
L(15,01)=14;L(15,02)=16;
L(16,01)=10;L(16,02)=13;L(16,03)=14;L(16,04)=15;
%number of bits
NBITS=log(NPTS)/log(2);
SP=1;
EP=16;
NP=20;
SR=0.5;
SR1=SR*100;
CL=(NOBS+2)*NBITS;
%*************************************************************************
%*************************************************************************
%*************************************************************************
d=zeros(NPTS,max(S_OL(1,:)));
Dist=zeros(NPTS,1);
P=zeros(NPTS,max(S_OL(1,:)));
CDF=zeros(NPTS,max(S_OL(1,:)));
for x=1:NPTS
    for y=1:S_OL(1,x)
        %Calculate Distance with each link point.
        d(x,y)=sqrt((X_co(L(x,y))-X_co(x))^2+(Y_co(L(x,y))-Y_co(x))^2);
        %total distance
        Dist(x,1)=Dist(x,1)+d(x,y);
    end
end
for x=1:NPTS
    for y=1:S_OL(1,x)
        %Calculate Probability for each link point.
        P(x,y)=(1-d(x,y)/Dist(x,1))/(S_OL(1,x)-1);
        if(y==1)
            %Calculate CDF.
            CDF(x,y)=P(x,y);
        end
        if(y~=1)
            CDF(x,y)=CDF(x,y-1)+P(x,y);
        end
    end
end
%*************************************************************************
%*************************************************************************
%*************************************************************************
%Generate Paths
for w=1:NP
    Curr_Point=SP;
    c=SP;
    i=1;
    PP(w,i)=Curr_Point;
    while(Curr_Point~=EP)
        i=i+1;
        t=rand(1,1);
        for y=1:(S_OL(1,c)-1)
            if((t>CDF(c,y))&&(t<=CDF(c,y+1)))
                Next_Point=L(c,y+1);
            end
            if(t<CDF(c,y))
                Next_Point=L(c,y);
            end
        end
        Prev_Point=Curr_Point;
        Curr_Point=Next_Point;
        if(i<3)
            PP(w,i)=Curr_Point;
        end
        if(i>=3)
            if(Curr_Point~=PP(w,(i-2)))
                PP(w,i)=Curr_Point;
            end
            if(Curr_Point==PP(w,(i-2)))
                i=i-2;
            end
        end
        c=Curr_Point;
    end
end
%*************************************************************************
%*************************************************************************
%*************************************************************************
%Making Envirment
x_range=[0 15 15 0 0];
y_range=[0 0 15 15 0];
plot(x_range,y_range,'red');hold on
for x=1:NPTS
    A=X_co(1,x);
    B=Y_co(1,x);
    for y=1:S_OL(1,x)
        C=X_co(1,L(x,y));
        D=Y_co(1,L(x,y));
        x_co=[A C];
        y_co=[B D];
        plot(x_co,y_co);hold on
    end
end
plot(X_co(SP),Y_co(SP),'*');hold on
plot(X_co(EP),Y_co(EP),'*');hold on
%*************************************************************************
%*************************************************************************
%*************************************************************************
%writing Data to file.
fid=fopen('abcd.txt','w');
for x=1:2
    for y=1:74
        fprintf(fid,'*');
    end
    fprintf(fid,'\r\n');
end
fprintf(fid,'|-------|-------|-------|-------|--------------------------');
fprintf(fid,'\r\n|  i\t| x(i)\t|  y(i)\t|  NOL\t|  Link_Points\r\n');
fprintf(fid,'|-------|-------|-------|-------|--------------------------');
fprintf(fid,'\r\n');
for x=1:NPTS
    fprintf(fid,'|  %d\t|  %d\t|  %d\t|  %d\t|  ',...
        x,X_co(1,x),Y_co(1,x),S_OL(1,x));
    for y=1:S_OL(1,x)
        fprintf(fid,'%d\t',L(x,y));
    end
    fprintf(fid,'\r\n');
end
fprintf(fid,'|-------|-------|-------|-------|--------------------------');
fprintf(fid,'\r\nStart Point:       ');
fprintf(fid,'%d',SP);
fprintf(fid,'\r\nEnd Point:        ');
fprintf(fid,'%d',EP);
fprintf(fid,'\r\nSelection Rate:   ');
fprintf(fid,'%d',SR1);
fprintf(fid,'\r\nNo. of Paths:     ');
fprintf(fid,'%d',NP);
fprintf(fid,'\r\n');
for x=1:2
    for y=1:74
        fprintf(fid,'*');
    end
    fprintf(fid,'\r\n');
end
for x=1:NPTS
    fprintf(fid,'Point ');
    fprintf(fid,'%d',x);
    fprintf(fid,':\r\n');
    fprintf(fid,'\ti\tLP\td(i)\t\tP(i)\t\tCDF(i)\r\n');
    for y=1:S_OL(1,x)
       fprintf(fid,'\t%d\t%d\t%f\t%f\t%f\r\n',...
           y,L(x,y),d(x,y),P(x,y),CDF(x,y));
    end
    for z=1:74
        fprintf(fid,'*');
    end
    fprintf(fid,'\r\n');
end 
for x=1:2
    for y=1:74
        fprintf(fid,'*');
    end
    fprintf(fid,'\r\n');
end
for w=1:NP
    fprintf(fid,'Path ');
    fprintf(fid,'%d',w);
    fprintf(fid,':\r\n\t\t');
    i=1;
    while(PP(w,i)~=0)
        fprintf(fid,'%d',PP(w,i));
        if(PP(w,i)==EP)
            fprintf(fid,'.\r\n');
            break;
        end
        if(PP(w,i)~=0)
            fprintf(fid,'-');
            i=i+1;
        end
    end
end
for x=1:2
    for y=1:74
        fprintf(fid,'*');
    end
    fprintf(fid,'\r\n');
end
fclose(fid);
output=open('abcd.txt');
%*************************************************************************
%*************************************************************************
%*************************************************************************