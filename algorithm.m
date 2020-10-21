clc;
clear all;
%Ali bin Mazhar Sultan
%160487
file=fopen('GA','w');
    fprintf(file, 'Genetic Algorithms Lab\n');
    fprintf(file, 'Created by Ali bin Mazhar 160487\n');
NPTS = 16;      %number of points
%NOBS = 7;       %number of obstacles
x = [1 1 3 3 5 6 6 8 10 10 10  11 13 12 14 16]; %x-coordinates of path points
y = [7 11 14 1 8 11 4 4 1 7 11 14 12 2 3 8 ];   %y-coordinates of path points
l = [2 4 5 0 ;  %1st point links
    1 3 0 0 ;   %2nd point links
    2 6 12 0 ;%3rd point links
    1 7 9 0 ;%4th point links
    1 6 7 0 ;%5th point links
    3 5 11 0 ;%6th point links
    4 5 8 0 ;%7th point links
    7 10 14 0 ;%8 th point links
    4 14 0 0 ;%9th point links
    8 11 16 0 ;%10th point links
    6 10 12 0 ;%11th point links
    3 11 13 0 ;%12th point links
    12 16 0 0 ;%13th point links
    8 9 5 16;%14th point links
    14 16 0 0; %15th point links
    10 13 14 15 %16 th point links
   ];
NoL = [3 2 3 3 3 3 3 3 2 3 3 3 2 4 2 4];    %number of links for each point
sumofpdf = zeros(NPTS,1); %variable to store sum of pdf
sumofF = zeros(NPTS,1);     %variable to store sum of F(x)
for i =1:1:NPTS     %outerloop for each point
    for j = 1:1:NoL(i)      %1st inner loop for each links of every point
        d(i,j) = sqrt((x(i)-x(l(i,j)))^2+(y(i)-y(l(i,j)))^2);   %distance from current point to the next point in the link   
        F(i,j) = 1/d(i,j);  %fitness function for each link point F(x) = 1/d
        sumofF(i) = sumofF(i)+F(i,j);   %adding all the fitness functions 
    end
    for k=1:1:NoL(i)    %2nd inner loop for calculating pdf and cdf 
        pdf(i,k) = F(i,k)/sumofF(i);    %calculating pdf = current link F /sum of all links F
        sumofpdf(i) = sumofpdf(i)+pdf(i,k); %sum of all pdfs 
        cdf(i,k) = sumofpdf(i); %cdf = pdf of current link + sum of pdfs of all previous links 
    end    
end
%generating text file
for k = 1:1:NPTS
    fprintf(file, '+++++++++++++++++++++++++++++++++++++++\n');
    fprintf(file, 'Link No: %1.0f\n', double(k) );
     fprintf(file, 'i\tLP(i)\tF(i)\tPDF(i)\tCDF(i)\n');
    for i=1:1:NoL(k)
       fprintf(file, '%1.0f\t%2.2f\t%2.2f\t%2.2f\t%2.2f\n',double(i),double(l(k,i)), double(F(k,i)),double(pdf(k,i)),double(cdf(k,i)));
    end
end
cdf