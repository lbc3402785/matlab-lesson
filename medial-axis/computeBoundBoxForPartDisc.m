function [bottom,top]=computeBoundBoxForPartDisc(center,radius,normal,u,radian)
v=cross(normal,u);

cosRadian=cos(radian);
sinRadian=sqrt(1-cosRadian*cosRadian);
%------------------------------------------------------
minX=center(1);
maxX=center(1);
if (u(1)*u(1)+v(1)*v(1)>0)
    costheta=u(1)/sqrt(u(1)*u(1)+v(1)*v(1));
    x1=radius*cosRadian*u(1)+radius*sinRadian*v(1);
    x2=radius*cosRadian*u(1)-radius*sinRadian*v(1);
    if (cosRadian>0)
        %不超过半个圆
        if (costheta>cosRadian)%case 1,2
            %正轴在范围内，这时负轴不可能在范围内
            maxX=center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1));
            minX=center(1)+min(0,min(x1,x2));
        elseif (costheta>0&&costheta<=cosRadian)%case3 case4
            %正轴角度小于90但是不是范围内，这时负轴不可能在范围内
            maxX=center(1)+max(0,max(x1,x2));
            minX=center(1)+min(0,min(x1,x2));
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %正轴角度大于90不是范围内，并且负轴不在范围内
            maxX=center(1)+max(0,max(x1,x2));
            minX=center(1)+min(0,min(x1,x2));
        elseif (costheta<0&&-costheta>cosRadian)%case7 case8
            %正轴角度大于90不是范围内，但是负轴在范围内
            maxX=center(1)+max(0,max(x1,x2));
            minX=center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1));
        end
    else
        %超过半个圆
        if(costheta>0&&-costheta<cosRadian)%case 9,10
            %正轴在范围内，但是负轴不在范围内
            maxX=center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1));
            minX=center(1)+min(0,min(x1,x2));
        elseif (costheta>0&&-costheta>=cosRadian)%case 11,12
            %正轴在范围内，负轴在范围内    
            maxX=center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1));
            minX=center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1));
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %正轴在范围内，负轴在范围内
            maxX=center(1)+radius*sqrt(u(1)*u(1)+v(1)*v(1));
            minX=center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1));
        else %case 13,14
            %正轴不在范围内，负轴在范围内
            maxX=center(1)+max(0,max(x1,x2));
            minX=center(1)-radius*sqrt(u(1)*u(1)+v(1)*v(1));
        end
    end
end

%------------------------------------------------------
minY=center(2);
maxY=center(2);
if (u(2)*u(2)+v(2)*v(2)>0)
    costheta=u(2)/sqrt(u(2)*u(2)+v(2)*v(2));
    y1=radius*cosRadian*u(2)+radius*sinRadian*v(2);
    y2=radius*cosRadian*u(2)-radius*sinRadian*v(2);
    if (cosRadian>0)
        %不超过半个圆
        if (costheta>cosRadian)%case 1,2
            %正轴在范围内，这时负轴不可能在范围内
            maxY=center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2));
            minY=center(2)+min(0,min(y1,y2));
        elseif (costheta>0&&costheta<=cosRadian)%case3 case4
            %正轴角度小于90但是不是范围内，这时负轴不可能在范围内
            maxY=center(2)+max(0,max(y1,y2));
            minY=center(2)+min(0,min(y1,y2));
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %正轴角度大于90不是范围内，并且负轴不在范围内
            maxY=center(2)+max(0,max(y1,y2));
            minY=center(2)+min(0,min(y1,y2));
        elseif (costheta<0&&-costheta>cosRadian)%case7 case8
            %正轴角度大于90不是范围内，但是负轴在范围内
            maxY=center(2)+max(0,max(y1,y2));
            minY=center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2));
        end
    else
        %超过半个圆
        if(costheta>0&&-costheta<cosRadian)%case 9,10
            %正轴在范围内，但是负轴不在范围内
            maxY=center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2));
            minY=center(2)+min(0,min(y1,y2));
        elseif (costheta>0&&-costheta>=cosRadian)%case 11,12
            %正轴在范围内，负轴在范围内    
            maxY=center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2));
            minY=center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2));
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %正轴在范围内，负轴在范围内
            maxY=center(2)+radius*sqrt(u(2)*u(2)+v(2)*v(2));
            minY=center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2));
        else %case 13,14
            %正轴不在范围内，负轴在范围内
            maxY=center(2)+max(0,max(y1,y2));
            minY=center(2)-radius*sqrt(u(2)*u(2)+v(2)*v(2));
        end
    end
end
%------------------------------------------------------

minZ=center(3);
maxZ=center(3);
if (u(3)*u(3)+v(3)*v(3)>0)
    costheta=u(3)/sqrt(u(3)*u(3)+v(3)*v(3));
    z1=radius*cosRadian*u(3)+radius*sinRadian*v(3);
    z2=radius*cosRadian*u(3)-radius*sinRadian*v(3);
    if (cosRadian>0)
        %不超过半个圆
        if (costheta>cosRadian)%case 1,2
            %正轴在范围内，这时负轴不可能在范围内
            maxZ=center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3));
            minZ=center(3)+min(0,min(z1,z2));
        elseif (costheta>0&&costheta<=cosRadian)%case3 case4
            %正轴角度小于90但是不是范围内，这时负轴不可能在范围内
            maxZ=center(3)+max(0,max(z1,z2));
            minZ=center(3)+min(0,min(z1,z2));
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %正轴角度大于90不是范围内，并且负轴不在范围内
            maxZ=center(3)+max(0,max(z1,z2));
            minZ=center(3)+min(0,min(z1,z2));
        elseif (costheta<0&&-costheta>cosRadian)%case7 case8
            %正轴角度大于90不是范围内，但是负轴在范围内
            maxZ=center(3)+max(0,max(z1,z2));
            minZ=center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3));
        end
    else
        %超过半个圆
        if(costheta>0&&-costheta<cosRadian)%case 9,10
            %正轴在范围内，但是负轴不在范围内
            maxZ=center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3));
            minZ=center(3)+min(0,min(z1,z2));
        elseif (costheta>0&&-costheta>=cosRadian)%case 11,12
            %正轴在范围内，负轴在范围内    
            maxZ=center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3));
            minZ=center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3));
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %正轴在范围内，负轴在范围内
            maxZ=center(3)+radius*sqrt(u(3)*u(3)+v(3)*v(3));
            minZ=center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3));
        else %case 13,14
            %正轴不在范围内，负轴在范围内
            maxZ=center(3)+max(0,max(z1,z2));
            minZ=center(3)-radius*sqrt(u(3)*u(3)+v(3)*v(3));
        end
    end
end
%------------------------------------------------------
bottom=[minX,minY,minZ];
top=[maxX,maxY,maxZ];
end