function [t1,t2,success]=LineSphereIntersection(center,radius,origin,direction)
    op=center-origin;
    b=dot(op,direction);
    disc=b*b-dot(op,op)+radius*radius;
    if(disc<0)
        success=false;
        t1=0;
        t2=0;
    else
        t1 = b - sqrt(disc);
        t2 = b + sqrt(disc);
        success=true;
    end
end