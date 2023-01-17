function [bottom,top]=computeBoundBoxForDiscSegment(center,radius,normal,u,radian)
v=cross(normal,u);

cosRadian=cos(radian);
sinRadian=sqrt(1-cosRadian*cosRadian);
%------------------------------------------------------
minX=center(1);
maxX=center(1);
cosxn=(dot([1,0,0],normal));
if (abs(abs(cosxn)-1)>1e-5)
    %x�᲻��ֱƽ��
    %x����ƽ���ͶӰ
    
    xp=[1,0,0]-cosxn*normal;
    %��һ��
    xp=xp/norm(xp);
    uxp=dot(u,xp);
    vxp=dot(v,xp);
    
    costheta=uxp/sqrt(uxp*uxp+vxp*vxp);
    x1=radius*cosRadian*uxp+radius*sinRadian*vxp;
    x2=radius*cosRadian*uxp-radius*sinRadian*vxp;
    if (cosRadian>0)
        %���������Բ
        if (costheta>cosRadian)%case 1,2
            %�����ڷ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=min(x1,x2);
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %����Ƕ�С��90���ǲ��Ƿ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxX=max(x1,x2);
            minX=min(x1,x2);
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ҹ��᲻�ڷ�Χ��
            maxX=max(x1,x2);
            minX=min(x1,x2);
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ǹ����ڷ�Χ��
            maxX=max(x1,x2);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
        end
    else
        %�������Բ
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %�����ڷ�Χ�ڣ����Ǹ��᲻�ڷ�Χ��
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=min(x1,x2);
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %�����ڷ�Χ�ڣ������ڷ�Χ��    
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %�����ڷ�Χ�ڣ������ڷ�Χ��
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
        else %case 15,16
            %���᲻�ڷ�Χ�ڣ������ڷ�Χ��
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
    %y�᲻��ֱƽ��
    %y����ƽ���ͶӰ
    
    yp=[0,1,0]-cosyn*normal;
    %��һ��
    yp=yp/norm(yp);
    uyp=dot(u,yp);
    vyp=dot(v,yp);
    
    costheta=uyp/sqrt(uyp*uyp+vyp*vyp);
    y1=radius*cosRadian*uyp+radius*sinRadian*vyp;
    y2=radius*cosRadian*uyp-radius*sinRadian*vyp;
    if (cosRadian>0)
        %���������Բ
        if (costheta>cosRadian)%case 1,2
            %�����ڷ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=min(y1,y2);
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %����Ƕ�С��90���ǲ��Ƿ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxY=max(y1,y2);
            minY=min(y1,y2);
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ҹ��᲻�ڷ�Χ��
            maxY=max(y1,y2);
            minY=min(y1,y2);
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ǹ����ڷ�Χ��
            maxY=max(y1,y2);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
        end
    else
        %�������Բ
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %�����ڷ�Χ�ڣ����Ǹ��᲻�ڷ�Χ��
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=min(y1,y2);
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %�����ڷ�Χ�ڣ������ڷ�Χ��    
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %�����ڷ�Χ�ڣ������ڷ�Χ��
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
        else %case 15,16
            %���᲻�ڷ�Χ�ڣ������ڷ�Χ��
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
    %y�᲻��ֱƽ��
    %y����ƽ���ͶӰ
    
    zp=[0,0,1]-coszn*normal;
    %��һ��
    zp=zp/norm(zp);
    uzp=dot(u,zp);
    vzp=dot(v,zp);
    
    costheta=uzp/sqrt(uzp*uzp+vzp*vzp);
    z1=radius*cosRadian*uzp+radius*sinRadian*vzp;
    z2=radius*cosRadian*uzp-radius*sinRadian*vzp;
    if (cosRadian>0)
        %���������Բ
        if (costheta>cosRadian)%case 1,2
            %�����ڷ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=min(z1,z2);
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %����Ƕ�С��90���ǲ��Ƿ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxZ=max(z1,z2);
            minZ=min(z1,z2);
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ҹ��᲻�ڷ�Χ��
            maxZ=max(z1,z2);
            minZ=min(z1,z2);
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ǹ����ڷ�Χ��
            maxZ=max(z1,z2);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
        end
    else
        %�������Բ
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %�����ڷ�Χ�ڣ����Ǹ��᲻�ڷ�Χ��
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=min(z1,z2);
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %�����ڷ�Χ�ڣ������ڷ�Χ��    
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %�����ڷ�Χ�ڣ������ڷ�Χ��
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
        else %case 13,14
            %���᲻�ڷ�Χ�ڣ������ڷ�Χ��
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