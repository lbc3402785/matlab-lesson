function [bottom,top,success,intersect,p1,p2]=computeBoundingBoxForTwoSphericalCap(center,radius,u1,radian1,u2,radian2)
    normal=cross(u1,u2);
    normal=normal/norm(normal);
    [inter1,inter2,num]=computeIntersectionOfTwoDiscSector(normal,u1,radian1,u2,radian2);
    p1=[0,0,0];
    p2=[0,0,0];
    if (num==0)
        bottom=[0,0,0];
        top=[0,0,0];
        success=false;
        intersect=false;
        return;
    else
        %计算两个圆的交点
        %先求两个面的圆心
        c1=cos(radian1)*u1;
        c2=cos(radian2)*u2;
        d1=dot(c1,u1);
        d2=dot(c2,u2);
        %u1\cdot c1=d1
        %u2\cdot c2=d2;
        p=PlanePlaneIntersection(normal,u1,d1,u2,d2);
        [t1,t2,intersect]=LineSphereIntersection([0,0,0],1,p,normal);
        if(~intersect)
            [bottom1,top1]=computeBoundingBoxForSphericalCap(u1,radian1);
            [bottom2,top2]=computeBoundingBoxForSphericalCap(u2,radian2);
            [bottom,top]=BoundingBoxIntersection(bottom1,top1,bottom2,top2);
        else
            p1=p+t1*normal;
            p2=p+t2*normal;
            cosRadian1=cos(radian1);
            cosRadian2=cos(radian2);
            bottom=[-solveAxisForTwoSphericalCap([-1,0,0],u1,cosRadian1,u2,cosRadian2,p1,p2),-solveAxisForTwoSphericalCap([0,-1,0],u1,cosRadian1,u2,cosRadian2,p1,p2),-solveAxisForTwoSphericalCap([0,0,-1],u1,cosRadian1,u2,cosRadian2,p1,p2)];
            top=[solveAxisForTwoSphericalCap([1,0,0],u1,cosRadian1,u2,cosRadian2,p1,p2),solveAxisForTwoSphericalCap([0,1,0],u1,cosRadian1,u2,cosRadian2,p1,p2),solveAxisForTwoSphericalCap([0,0,1],u1,cosRadian1,u2,cosRadian2,p1,p2)];
            p1=p1*radius+center;
            p2=p2*radius+center;
        end
        bottom=bottom*radius+center;
        top=top*radius+center;
        success=true;
    end
end