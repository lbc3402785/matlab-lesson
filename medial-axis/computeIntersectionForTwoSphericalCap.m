function [success,isInterSect,p1,p2]=computeIntersectionForTwoSphericalCap(center,radius,u1,radian1,u2,radian2)
    normal=cross(u1,u2);
    normal=normal/norm(normal);
    [inter1,inter2,num]=computeIntersectionOfTwoDiscSector(normal,u1,radian1,u2,radian2);
    p1=[0,0,0];
    p2=[0,0,0];
    if (num==0)
        success=false;
        isInterSect=false;
        return;
    else
        success=true;
        %计算两个圆的交点
        %先求两个面的圆心
        c1=cos(radian1)*u1;
        c2=cos(radian2)*u2;
        d1=dot(c1,u1);
        d2=dot(c2,u2);
        %u1\cdot c1=d1
        %u2\cdot c2=d2;
        p=PlanePlaneIntersection(normal,u1,d1,u2,d2);
        [t1,t2,isInterSect]=LineSphereIntersection([0,0,0],1,p,normal);
        if(~isInterSect)
            disp('no intersection!');
        end
        p1=p+t1*normal;
        p2=p+t2*normal;
        p1=center+radius*p1;
        p2=center+radius*p2;
    end
end