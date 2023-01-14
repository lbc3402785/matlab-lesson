function drawPartDisc(O,r,normal,u,radian)
%% ¿ªÊ¼»æÖÆ3Î¬Ô²È¦
axis equal;
theta = linspace(-radian, radian, 100);
v=cross(normal,u);
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