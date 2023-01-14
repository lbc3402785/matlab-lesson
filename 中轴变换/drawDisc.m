function drawDisc(O,r,normal)
%% ¿ªÊ¼»æÖÆ3Î¬Ô²È¦
axis equal;
theta = linspace(0, 2*pi, 100);
u=[0,0,0];
v=[0,0,0];
if abs(normal(1))>abs(normal(2))
   u=[-normal(3),0,normal(1)];
   u=u/norm(u);
   v=cross(normal,u);
else
   u=[0,normal(3),-normal(2)];
   u=u/norm(u);
   v=cross(normal,u);
end
x=O(1)+r*u(1)*cos(theta)+r*v(1)*sin(theta);
y=O(2)+r*u(2)*cos(theta)+r*v(2)*sin(theta);
z=O(3)+r*u(3)*cos(theta)+r*v(3)*sin(theta);
for k=1:100
    line([O(1),x(k)],[O(2),y(k)],[O(3),z(k)],'LineStyle','--','LineWidth',1,'Color','r');
    hold on;
end

plot3(x,y,z,'r-', 'LineWidth', 1.3)
hold on;
end