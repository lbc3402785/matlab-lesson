% V=[2,2,2]; %the normal to the plane of the triangle
% V=V/norm(V); % unit vector for the normal
% A=(p1-in)/norm(p1-in); % a unit vector on the plane passing through center of the circle
% B=cross(A,V); % a vector perpendicular to A and in the plane of the triangle. A and B act as the axes
% th=0:0.01:2*pi;
% x=in(1)+r*cos(th)*A(1)+r*sin(th)*B(1);
% y=in(2)+r*cos(th)*A(2)+r*sin(th)*B(2);
% z=in(3)+r*cos(th)*A(3)+r*sin(th)*B(3);
% hold on
% l=plot3(x,y,z)

c1=[3,6,1];
c2=[10,5,0];
%c3=[8,4,8];
r1=1;
r2=3;
%r3=2;
[L1,R1,L2,R2,d0,cos_phi,sin_phi]=drawMedialCone(c1,c2,r1,r2,180,64,'FaceAlpha',1);
pa=(L1+R1)*0.5;
ra=norm(L1-R1)*0.5;
pb=(L2+R2)*0.5;
rb=norm(L2-R2)*0.5;
[bottom,top]=computeBoundBoxForFrustumCone(pa,ra,pb,rb);
draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','blue');
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
axis equal;

