function [bottom,top]=computeBoundBoxForDiscSegment(center,radius,normal,u,radian)
v=cross(normal,u);

cosRadian=cos(radian);
sinRadian=sqrt(1-cosRadian*cosRadian);
%------------------------------------------------------
minX=center(1);
maxX=center(1);
cosxn=(dot([1,0,0],normal));
if (abs(abs(cosxn)-1)>1e-5)
    %x轴不垂直平面
    %x轴在平面的投影
    
    xp=[1,0,0]-cosxn*normal;
    %归一化
    xp=xp/norm(xp);
    uxp=dot(u,xp);
    vxp=dot(v,xp);
    
    costheta=uxp/sqrt(uxp*uxp+vxp*vxp);
    x1=radius*cosRadian*uxp+radius*sinRadian*vxp;
    x2=radius*cosRadian*uxp-radius*sinRadian*vxp;
    if (cosRadian>0)
        %不超过半个圆
        if (costheta>cosRadian)%case 1,2
            %正轴在范围内，这时负轴不可能在范围内
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=min(x1,x2);
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %正轴角度小于90但是不是范围内，这时负轴不可能在范围内
            maxX=max(x1,x2);
            minX=min(x1,x2);
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %正轴角度大于90不是范围内，并且负轴不在范围内
            maxX=max(x1,x2);
            minX=min(x1,x2);
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %正轴角度大于90不是范围内，但是负轴在范围内
            maxX=max(x1,x2);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
        end
    else
        %超过半个圆
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %正轴在范围内，但是负轴不在范围内
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=min(x1,x2);
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %正轴在范围内，负轴在范围内    
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %正轴在范围内，负轴在范围内
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
        else %case 15,16
            %正轴不在范围内，负轴在范围内
            maxX=max(x1,x2);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
        end
    end
    sinxn=sqrt(1-cosxn*cosxn);
    maxX=maxX*sinxn;
    maxX=maxX+center(1);
    minX=minX*sinxn;
    minX=minX+center(1);
end
%------------------------------------------------------
minY=center(2);
maxY=center(2);
cosyn=(dot([0,1,0],normal));
if (abs(abs(cosyn)-1)>1e-5)
    %y轴不垂直平面
    %y轴在平面的投影
    
    yp=[0,1,0]-cosyn*normal;
    %归一化
    yp=yp/norm(yp);
    uyp=dot(u,yp);
    vyp=dot(v,yp);
    
    costheta=uyp/sqrt(uyp*uyp+vyp*vyp);
    y1=radius*cosRadian*uyp+radius*sinRadian*vyp;
    y2=radius*cosRadian*uyp-radius*sinRadian*vyp;
    if (cosRadian>0)
        %不超过半个圆
        if (costheta>cosRadian)%case 1,2
            %正轴在范围内，这时负轴不可能在范围内
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=min(y1,y2);
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %正轴角度小于90但是不是范围内，这时负轴不可能在范围内
            maxY=max(y1,y2);
            minY=min(y1,y2);
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %正轴角度大于90不是范围内，并且负轴不在范围内
            maxY=max(y1,y2);
            minY=min(y1,y2);
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %正轴角度大于90不是范围内，但是负轴在范围内
            maxY=max(y1,y2);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
        end
    else
        %超过半个圆
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %正轴在范围内，但是负轴不在范围内
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=min(y1,y2);
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %正轴在范围内，负轴在范围内    
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %正轴在范围内，负轴在范围内
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
        else %case 15,16
            %正轴不在范围内，负轴在范围内
            maxY=max(y1,y2);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
        end
    end
    sinyn=sqrt(1-cosyn*cosyn);
    maxY=maxY*sinyn;
    maxY=maxY+center(2);
    minY=minY*sinyn;
    minY=minY+center(2);
end
%------------------------------------------------------
minZ=center(3);
maxZ=center(3);
coszn=(dot([0,0,1],normal));
if (abs(abs(coszn)-1)>1e-5)
    %y轴不垂直平面
    %y轴在平面的投影
    
    zp=[0,0,1]-coszn*normal;
    %归一化
    zp=zp/norm(zp);
    uzp=dot(u,zp);
    vzp=dot(v,zp);
    
    costheta=uzp/sqrt(uzp*uzp+vzp*vzp);
    z1=radius*cosRadian*uzp+radius*sinRadian*vzp;
    z2=radius*cosRadian*uzp-radius*sinRadian*vzp;
    if (cosRadian>0)
        %不超过半个圆
        if (costheta>cosRadian)%case 1,2
            %正轴在范围内，这时负轴不可能在范围内
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=min(z1,z2);
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %正轴角度小于90但是不是范围内，这时负轴不可能在范围内
            maxZ=max(z1,z2);
            minZ=min(z1,z2);
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %正轴角度大于90不是范围内，并且负轴不在范围内
            maxZ=max(z1,z2);
            minZ=min(z1,z2);
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %正轴角度大于90不是范围内，但是负轴在范围内
            maxZ=max(z1,z2);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
        end
    else
        %超过半个圆
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %正轴在范围内，但是负轴不在范围内
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=min(z1,z2);
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %正轴在范围内，负轴在范围内    
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %正轴在范围内，负轴在范围内
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
        else %case 13,14
            %正轴不在范围内，负轴在范围内
            maxZ=max(z1,z2);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
        end
    end
    sinzn=sqrt(1-coszn*coszn);
    maxZ=maxZ*sinzn;
    maxZ=maxZ+center(3);
    minZ=minZ*sinzn;
    minZ=minZ+center(3);
end
%------------------------------------------------------
bottom=[minX,minY,minZ];
top=[maxX,maxY,maxZ];
end