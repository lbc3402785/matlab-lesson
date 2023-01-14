function [bottom,top]=computeBoundBoxForPartDisc(center,radius,normal,u,radian)
v=cross(normal,u);

cosRadian=cos(radian);
sinRadian=sqrt(1-cosRadian*cosRadian);
%------------------------------------------------------
costheta=u(1)/sqrt(u(1)*u(1)+v(1)*v(1));
minX=center(1);
maxX=center(1);
x1=radius*cosRadian*u(1)+radius*sinRadian*v(1);
x2=radius*cosRadian*u(1)-radius*sinRadian*v(1);
if (costheta>0&&costheta>cosRadian)%case1 case2
    maxX=center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1));
    minX=center(1)+min(0,min(x1,x2));
elseif (costheta>0&&costheta<=cosRadian)%case3 case4
    maxX=center(1)+max(0,max(x1,x2));
    minX=center(1)+min(0,min(x1,x2));
elseif (costheta<=0&&costheta>cosRadian)%case5 case6
    maxX=center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1));
    minX=center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1));
elseif (costheta<=0&&costheta<=cosRadian&&cosRadian<0)%case7 case8
    maxX=center(1)+max(0,max(x1,x2));
    minX=center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1));
elseif (costheta<=0&&-costheta<cosRadian)%case9 case10
    maxX=center(1)+max(0,max(x1,x2));
    minX=center(1)+min(0,min(x1,x2));  
else
    maxX=center(1)+max(0,max(x1,x2));%case11 case12
    minX=center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1));
end
%------------------------------------------------------
costheta=u(2)/sqrt(u(2)*u(2)+v(2)*v(2));
minY=center(2);
maxY=center(2);
y1=radius*cosRadian*u(2)+radius*sinRadian*v(2);
y2=radius*cosRadian*u(2)-radius*sinRadian*v(2);
if (costheta>0&&costheta>cosRadian)%case1 case2
    maxY=center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2));
    minY=center(2)+min(0,min(y1,y2));
elseif (costheta>0&&costheta<=cosRadian)%case3 case4
    maxY=center(2)+max(0,max(y1,y2));
    minY=center(2)+min(0,min(y1,y2));
elseif (costheta<=0&&costheta>cosRadian)%case5 case6
    maxY=center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2));
    minY=center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2));
elseif (costheta<=0&&costheta<=cosRadian&&cosRadian<0)%case7 case8
    maxY=center(2)+max(0,max(y1,y2));
    minY=center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2));
elseif (costheta<=0&&-costheta<cosRadian)%case9 case10
    maxY=center(2)+max(0,max(y1,y2));
    minY=center(2)+min(0,min(y1,y2));  
else
    maxY=center(2)+max(0,max(y1,y2));%case11 case12
    minY=center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2));
end
%------------------------------------------------------
costheta=u(3)/sqrt(u(3)*u(3)+v(3)*v(3));
minZ=center(3);
maxZ=center(3);
z1=radius*cosRadian*u(3)+radius*sinRadian*v(3);
z2=radius*cosRadian*u(3)-radius*sinRadian*v(3);
if (costheta>0&&costheta>cosRadian)%case1 case2
    maxZ=center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3));
    minZ=center(3)+min(0,min(z1,z2));
elseif (costheta>0&&costheta<=cosRadian)%case3 case4
    maxZ=center(3)+max(0,max(z1,z2));
    minZ=center(3)+min(0,min(z1,z2));
elseif (costheta<=0&&costheta>cosRadian)%case5 case6
    maxZ=center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3));
    minZ=center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3));
elseif (costheta<=0&&costheta<=cosRadian&&cosRadian<0)%case7 case8
    maxZ=center(3)+max(0,max(z1,z2));
    minZ=center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3));
elseif (costheta<=0&&-costheta<cosRadian)%case9 case10
    maxZ=center(3)+max(0,max(z1,z2));
    minZ=center(3)+min(0,min(z1,z2));  
else
    maxZ=center(3)+max(0,max(z1,z2));%case11 case12
    minZ=center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3));
end
%------------------------------------------------------
bottom=[minX,minY,minZ];
top=[maxX,maxY,maxZ];
end