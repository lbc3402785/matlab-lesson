function [X,Y,Z,pos]=createRadianArc(c,phi,u,v,r)
if(~exist('r','var'))
    r = 0.1;  % 如果未出现该变量，则对其进行赋值
end
u=u/norm(u);
v=v/norm(v);
th = 0:1/360:phi;  
qs=transpose([cos(th/2);-sin((th/2))*v(1);-sin((th/2))*v(2);-sin((th/2))*v(3)]);
P=r*quatrotate(qs,u);
X=P(:,1)+c(1);
Y=P(:,2)+c(2);
Z=P(:,3)+c(3);
q=[cos(phi/4),sin(phi/4)*v(1),sin(phi/4)*v(2),sin(phi/4)*v(3)];
d=1.5*r*quatrotate(q,u);
pos=c+d;
end