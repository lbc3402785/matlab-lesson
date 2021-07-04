%x=(a+r1*cos(\phi))*cos(\theta)+b
%y=(a+r1*sin(\phi))*cos(\theta)+b
%z=c+r1*sin(\phi)
figure;
r=linspace(0,2*pi,60);
s=linspace(0,2*pi,60);
[u,v]=meshgrid(r,s);
a=3;
b=4;
c=5;
r1=2;
x=(a+r1*cos(v)).*cos(u)+b;
y=(a+r1*cos(v)).*sin(u)+b;
z=c+r1*sin(v);
surf(x,y,z);
title('圆环面');
shading interp;
colormap(hot);
axis equal;
