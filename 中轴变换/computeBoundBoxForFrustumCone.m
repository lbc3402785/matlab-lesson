function [bottom,top]=computeBoundBoxForFrustumCone(pa,ra,pb,rb)
axis=pb-pa;
axis=axis/norm(axis);
a2=[axis(1)*axis(1),axis(2)*axis(2),axis(3)*axis(3)];
e=[sqrt(1-a2(1)),sqrt(1-a2(2)),sqrt(1-a2(3))];
b1=pa-e*ra;
b2=pb-e*rb;
t1=pa+e*ra;
t2=pb+e*rb;
bottom=[min(b1(1),b2(1)),min(b1(2),b2(2)),min(b1(3),b2(3))];
top=[max(t1(1),t2(1)),max(t1(2),t2(2)),max(t1(3),t2(3))];
end