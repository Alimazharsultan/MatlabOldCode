%Tamoor Hamza 160439
clc;
clear all;
NPTS = 16;      
%NOBS = 7;      
xpoint = [1 1 3 3 5 6 6 8 10 10 10  11 13 12 14 16]; 
ypoint = [7 11 14 1 8 11 4 4 1 7 11 14 12 2 3 8 ];   
links = [2 4 5 0 ;1 3 0 0 ;2 6 12 0 ;1 7 9 0 ; 1 6 7 0 ; 3 5 11 0 ;  4 5 8 0 ;7 10 14 0 ;4 14 0 0 ; 8 11 16 0 ;6 10 12 0 ;3 11 13 0 ;12 16 0 0 ;8 9 5 16;14 16 0 0;10 13 14 15 ];
numberoflinks = [3 2 3 3 3 3 3 3 2 3 3 3 2 4 2 4];   
pdfsum = zeros(NPTS); 
Fxsum = zeros(NPTS);   
for i =1:1:NPTS     
    for j = 1:1:numberoflinks(i) 
        d(i,j) = sqrt((xpoint(i)-xpoint(links(i,j)))^2+(ypoint(i)-ypoint(links(i,j)))^2);    
        F(i,j) = 1/d(i,j); 
        Fxsum(i) = Fxsum(i)+F(i,j);   
    end
    for k=1:1:numberoflinks(i)    
        pdf(i,k) = F(i,k)/Fxsum(i); 
        pdfsum(i) = pdfsum(i)+pdf(i,k); 
        cdf(i,k) = pdfsum(i);  
    end    
end
file=fopen('output file','w');
for n = 1:1:NPTS
    fprintf(file, 'Link No: %f\n', double(n) );
     fprintf(file, 'No\t\tLP\tF\t\tPDF\t\tCDF\n');
    for m=1:1:numberoflinks(n)
       fprintf(file, '%1.0f\t%2.2f\t%2.2f\t%2.2f\t%2.2f\n',double(m),double(links(n,m)), double(F(n,m)),double(pdf(n,m)),double(cdf(n,m)));
    end
end
