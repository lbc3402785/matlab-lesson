function [X,Y,Z]=createCircle(c,u,v,r,m)
th = 0:pi/m:2*pi;
qs=transpose([cos(th/2);sin((th/2))*v(1);sin((th/2))*v(2);sin((th/2))*v(3)]);
P=r*quatrotate(qs,u);
X=P(:,1)+c(1);
Y=P(:,2)+c(2);
Z=P(:,3)+c(3);
end