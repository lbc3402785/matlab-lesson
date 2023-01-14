function [bottom,top]=computeBoundBoxForDisc(center,radius,normal)
if abs(normal(1))>abs(normal(2))
   u=[-normal(3),0,normal(1)];
   u=u/norm(u);
   v=cross(normal,u);
   bottom=[center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1)),center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2)),center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3))];
   top=[center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1)),center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2)),center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3))];
else
   u=[0,normal(3),-normal(2)];
   u=u/norm(u);
   v=cross(normal,u);
   bottom=[center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1)),center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2)),center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3))];
   top=[center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1)),center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2)),center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3))];
end
% bottom=[center(1)-radius*sqrt(1-normal(1)*normal(1)),center(2)-radius*sqrt(1-normal(2)*normal(2)),center(3)-radius*sqrt(1-normal(3)*normal(3))];
% top=[center(1)+radius*sqrt(1-normal(1)*normal(1)),center(2)+radius*sqrt(1-normal(2)*normal(2)),center(3)+radius*sqrt(1-normal(3)*normal(3))];
end