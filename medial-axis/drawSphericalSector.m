function drawSphericalSector(center,radius,axis,radian)
u=[0,0,0];
v=[0,0,0];
if abs(axis(1))>abs(axis(2))
   u=[-axis(3),0,axis(1)];
   u=u/norm(u);
   v=cross(axis,u);
else
   u=[0,axis(3),-axis(2)];
   u=u/norm(u);
   v=cross(axis,u);
end
theta = linspace(0, 2*pi, 100);
N=50;
phi=linspace(0, radian, N);
X=[];
Y=[];
Z=[];
for k=1:N
    rd=radius*sin(phi(k));
    h=radius*cos(phi(k));
    x=transpose(center(1)+rd*u(1)*cos(theta)+rd*v(1)*sin(theta)+h*axis(1));
    y=transpose(center(2)+rd*u(2)*cos(theta)+rd*v(2)*sin(theta)+h*axis(2));
    z=transpose(center(3)+rd*u(3)*cos(theta)+rd*v(3)*sin(theta)+h*axis(3));
    %plot3(x,y,z,'r-', 'LineWidth', 1.3);
    X=cat(2,X,x);
    Y=cat(2,Y,y);
    Z=cat(2,Z,z);
end
%draw sphere part
h=surf(X,Y,Z);
set(h,'FaceColor','cyan','FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
hold on;
%draw cone
rB=radius*sin(radian);
hB=radius*cos(radian);
centerB=center+hB*axis;
X1=transpose(centerB(1)+rB*u(1)*cos(theta)+rB*v(1)*sin(theta));
Y1=transpose(centerB(2)+rB*u(2)*cos(theta)+rB*v(2)*sin(theta));
Z1=transpose(centerB(3)+rB*u(3)*cos(theta)+rB*v(3)*sin(theta));
X2=transpose(center(1)+0*u(1)*cos(theta)+0*v(1)*sin(theta));
Y2=transpose(center(2)+0*u(2)*cos(theta)+0*v(2)*sin(theta));
Z2=transpose(center(3)+0*u(3)*cos(theta)+0*v(3)*sin(theta));
X=X1;
Y=Y1;
Z=Z1;
M=100;
for i=1:M
    XI=(X2-X1)*i/M+X1;
    YI=(Y2-Y1)*i/M+Y1;
    ZI=(Z2-Z1)*i/M+Z1;
    %plot3(x,y,z,'r-', 'LineWidth', 1.3);
    X=cat(2,X,XI);
    Y=cat(2,Y,YI);
    Z=cat(2,Z,ZI);
end
h=surf(X,Y,Z);
set(h,'FaceColor','magenta','FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');
hold on;
end