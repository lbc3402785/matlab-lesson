function drawSpherialSector(center,radius,axis,radian)
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
phi=linspace(0, radian, 50);
x=[];
y=[];
z=[];
for k=1:50
    rd=radius*sin(phi(k));
    h=radius*cos(phi(k));
    x=[center(1)+rd*u(1)*cos(theta)+rd*v(1)*sin(theta)+h*axis(1)];
    y=[center(2)+rd*u(2)*cos(theta)+rd*v(2)*sin(theta)+h*axis(2)];
    z=[center(3)+rd*u(3)*cos(theta)+rd*v(3)*sin(theta)+h*axis(3)];
    plot3(x,y,z,'r-', 'LineWidth', 1.3);
    hold on;
end
for k=1:100
    line([center(1),x(k)],[center(2),y(k)],[center(3),z(k)],'LineStyle','--','LineWidth',1,'Color','r');
    hold on;
end
hold on;
end