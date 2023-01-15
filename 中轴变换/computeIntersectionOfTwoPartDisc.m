function [v1,theta1,v2,theta2,num,success]=computeIntersectionOfTwoPartDisc(center,radius,normal,u1,radian1,u2,radian2)
    costheta=dot(u1,u2);%无方向夹角
    %校正方向
    if dot(cross(u1,u2),normal)<0
       tmp=u1;
       u1=u2;
       u2=tmp;
       tmpR=radian1;
       radian1=radian2;
       radian2=tmpR;
    end
    %以u1为起始旋转轴，第一个区间为[-radian1,radian1]
    theta=acos(costheta);
    %第二个区间为[theta-radian2,theta+radian2]
    if (radian1<theta-radian2)
        %无交集
        success=false;
        return;
    else if (radian1>theta-radian2&&radian1<theta)
        %1个交集 
        num=1;
        theta1=(radian1+radian2-theta)*0.5;
        
    end
end