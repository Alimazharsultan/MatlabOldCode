clc 
clear
x1=1;
x2=15;
y1=2;
y2=2;
theta1 = (2*pi)/3;
theta2 = (pi)/3;
r1 = 2;
r2 = 2;
pc1x = (x1+r1*cos(theta1-(pi/2)));
pc1y = (y1+r1*sin(theta1-(pi/2)));
pc2x = (x2+r2*cos(theta2-(pi/2)));
pc2y = (y2+r2*sin(theta2-(pi/2)));
c2 = [pc2x pc2y];
c1 = [pc1x pc1y];
v1 = [pc2x-pc1x pc2y-pc1y]
D = sqrt((pc2x-pc1x).^2+(pc2y-pc1y).^2); %distance between centre points of two circles
pc3x= ((pc2x+pc1x)/2);
pc3y= ((pc2y+pc1y)/2);
c3 = [pc3x pc3y];
r3 = (D/2);
c4 = [pc1x pc1y];
r4 = r1+r2;
[xt,yt] = circcirc(pc3x,pc3y, r3, pc1x, pc1y, r4 )  %intersection point of circle 3 and cirlce4
xt = xt(2); %2nd intersection point
yt = yt(2);
pt = [xt yt];
[xit1,yit1] = circcirc(pc3x, pc3y, r3, pc1x, pc1y, r1)
xit1 = xit1(2);
yit1 = yit1(2);
pit1 = [xit1 yit1];
[xit2,yit2] = circcirc(pc3x, pc3y, r3, pc2x, pc2y, r2); 
xit2 = xit2(2);
yit2 = yit2(2);
pit2 = [xit2 yit2]
D2 = sqrt((pit2(1)-pit1(1)).^2+(pit2(2)-pit1(2)).^2);
viscircles(c1, r1)
viscircles(c2, r2)
viscircles(c3, r3)
viscircles(c4, r4)
axis equal; 
hold on
plot([pc2x, pc1x], [pc2y, pc1y]);
hold on
plot([pc1x xt], [pc1y yt], 'g', 'Linewidth', 3);
hold on
plot([pc1x pc3x], [pc1y pc3y], 'g', 'Linewidth', 3);
hold on
plot([pc3x xt], [pc3y yt], 'g', 'Linewidth', 3);
hold on
plot([xit2 xit1], [yit2 yit1], 'p', 'Linewidth', 2);
hold on
plot([pc2x xt], [pc2y yt], 'p', 'Linewidth', 2);




