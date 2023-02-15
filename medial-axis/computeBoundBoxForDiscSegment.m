function [bottom,top,keys]=computeBoundBoxForDiscSegment(center,radius,normal,u,radian)
keys=java.util.ArrayList();
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
    sintheta=vxp/sqrt(uxp*uxp+vxp*vxp);
    x1=radius*cosRadian*uxp+radius*sinRadian*vxp;%theta_0=acos(cosRadian)
    x2=radius*cosRadian*uxp-radius*sinRadian*vxp;%theta_1=-acos(cosRadian)
    p1=[0,0,0];
    p2=[0,0,0];
    if (cosRadian>0)
        %���������Բ
        if (costheta>cosRadian)%case 1,2
            %�����ڷ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=min(x1,x2);
            p1=radius*costheta*u+radius*sintheta*v;
            if(x1<x2)
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %����Ƕ�С��90���ǲ��Ƿ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxX=max(x1,x2);
            minX=min(x1,x2);
            if(x1<x2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ҹ��᲻�ڷ�Χ��
            maxX=max(x1,x2);
            minX=min(x1,x2);
            if(x1<x2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ǹ����ڷ�Χ��
            maxX=max(x1,x2);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
            if(x1<x2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
            end
            p2=-(radius*costheta*u+radius*sintheta*v);
        end
    else
        %�������Բ
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %�����ڷ�Χ�ڣ����Ǹ��᲻�ڷ�Χ��
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=min(x1,x2);
            p1=radius*costheta*u+radius*sintheta*v;
            if(x1<x2)
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %�����ڷ�Χ�ڣ������ڷ�Χ��    
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
            p1=radius*costheta*u+radius*sintheta*v;
            p2=-(radius*costheta*u+radius*sintheta*v);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %�����ڷ�Χ�ڣ������ڷ�Χ��
            maxX=radius*sqrt(uxp*uxp+vxp*vxp);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
            p1=radius*costheta*u+radius*sintheta*v;
            p2=-(radius*costheta*u+radius*sintheta*v);
        else %case 15,16
            %���᲻�ڷ�Χ�ڣ������ڷ�Χ��
            maxX=max(x1,x2);
            minX=-radius*sqrt(uxp*uxp+vxp*vxp);
            if(x1<x2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
            end
            p2=-(radius*costheta*u+radius*sintheta*v);
        end
    end
    sinxn=sqrt(1-cosxn*cosxn);
    maxX=maxX*sinxn;
    maxX=maxX+center(1);
    p1=p1+center;
    minX=minX*sinxn;
    minX=minX+center(1);
    p2=p2+center;
    keys.add(p1);
    keys.add(p2);
else
    keys.add(center);
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
    sintheta=vyp/sqrt(uyp*uyp+vyp*vyp);
    y1=radius*cosRadian*uyp+radius*sinRadian*vyp;
    y2=radius*cosRadian*uyp-radius*sinRadian*vyp;
    p1=[0,0,0];
    p2=[0,0,0];
    if (cosRadian>0)
        %���������Բ
        if (costheta>cosRadian)%case 1,2
            %�����ڷ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=min(y1,y2);
            p1=radius*costheta*u+radius*sintheta*v;
            if(y1<y2)
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %����Ƕ�С��90���ǲ��Ƿ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxY=max(y1,y2);
            minY=min(y1,y2);
            if(y1<y2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ҹ��᲻�ڷ�Χ��
            maxY=max(y1,y2);
            minY=min(y1,y2);
            if(y1<y2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ǹ����ڷ�Χ��
            maxY=max(y1,y2);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
            if(y1<y2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
            end
            p2=-(radius*costheta*u+radius*sintheta*v);
        end
    else
        %�������Բ
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %�����ڷ�Χ�ڣ����Ǹ��᲻�ڷ�Χ��
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=min(y1,y2);
            p1=radius*costheta*u+radius*sintheta*v;
            if(y1<y2)
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %�����ڷ�Χ�ڣ������ڷ�Χ��    
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
            p1=radius*costheta*u+radius*sintheta*v;
            p2=-(radius*costheta*u+radius*sintheta*v);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %�����ڷ�Χ�ڣ������ڷ�Χ��
            maxY=radius*sqrt(uyp*uyp+vyp*vyp);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
            p1=radius*costheta*u+radius*sintheta*v;
            p2=-(radius*costheta*u+radius*sintheta*v);
        else %case 15,16
            %���᲻�ڷ�Χ�ڣ������ڷ�Χ��
            maxY=max(y1,y2);
            minY=-radius*sqrt(uyp*uyp+vyp*vyp);
            if(y1<y2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
            end
            p2=-(radius*costheta*u+radius*sintheta*v);
        end
    end
    sinyn=sqrt(1-cosyn*cosyn);
    maxY=maxY*sinyn;
    maxY=maxY+center(2);
    p1=p1+center;
    minY=minY*sinyn;
    minY=minY+center(2);
    p2=p2+center;
    keys.add(p1);
    keys.add(p2);
else
    keys.add(center);
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
    sintheta=vzp/sqrt(uzp*uzp+vzp*vzp);
    z1=radius*cosRadian*uzp+radius*sinRadian*vzp;
    z2=radius*cosRadian*uzp-radius*sinRadian*vzp;
    p1=[0,0,0];
    p2=[0,0,0];
    if (cosRadian>0)
        %���������Բ
        if (costheta>cosRadian)%case 1,2
            %�����ڷ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=min(z1,z2);
            p1=radius*costheta*u+radius*sintheta*v;
            if(z1<z2)
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta>=0&&costheta<=cosRadian)%case3 case4
            %����Ƕ�С��90���ǲ��Ƿ�Χ�ڣ���ʱ���᲻�����ڷ�Χ��
            maxZ=max(z1,z2);
            minZ=min(z1,z2);
            if(z1<z2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta<0&&-costheta<cosRadian)%case5 case6
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ҹ��᲻�ڷ�Χ��
            maxZ=max(z1,z2);
            minZ=min(z1,z2);
            if(z1<z2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta<0&&-costheta>=cosRadian)%case7 case8
            %����Ƕȴ���90���Ƿ�Χ�ڣ����Ǹ����ڷ�Χ��
            maxZ=max(z1,z2);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
            if(z1<z2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
            end
            p2=-(radius*costheta*u+radius*sintheta*v);
        end
    else
        %�������Բ
        if(costheta>=0&&-costheta<cosRadian)%case 9,10
            %�����ڷ�Χ�ڣ����Ǹ��᲻�ڷ�Χ��
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=min(z1,z2);
            p1=radius*costheta*u+radius*sintheta*v;
            if(z1<z2)
                p2=radius*cosRadian*u+radius*sinRadian*v;
            else
                p2=radius*cosRadian*u-radius*sinRadian*v;
            end
        elseif (costheta>=0&&(-costheta)>=cosRadian)%case 11,12
            %�����ڷ�Χ�ڣ������ڷ�Χ��    
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
            p1=radius*costheta*u+radius*sintheta*v;
            p2=-(radius*costheta*u+radius*sintheta*v);
        elseif (costheta<0&&costheta>cosRadian)%case 13,14
            %�����ڷ�Χ�ڣ������ڷ�Χ��
            maxZ=radius*sqrt(uzp*uzp+vzp*vzp);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
            p1=radius*costheta*u+radius*sintheta*v;
            p2=-(radius*costheta*u+radius*sintheta*v);
        else %case 13,14
            %���᲻�ڷ�Χ�ڣ������ڷ�Χ��
            maxZ=max(z1,z2);
            minZ=-radius*sqrt(uzp*uzp+vzp*vzp);
            if(z1<z2)
                p1=radius*cosRadian*u-radius*sinRadian*v;
            else
                p1=radius*cosRadian*u+radius*sinRadian*v;
            end
            p2=-(radius*costheta*u+radius*sintheta*v);
        end
    end
    sinzn=sqrt(1-coszn*coszn);
    maxZ=maxZ*sinzn;
    maxZ=maxZ+center(3);
    p1=p1+center;
    minZ=minZ*sinzn;
    minZ=minZ+center(3);
    p2=p2+center;
    keys.add(p1);
    keys.add(p2);
else
    keys.add(center);
end
%------------------------------------------------------
bottom=[minX,minY,minZ];
top=[maxX,maxY,maxZ];
end