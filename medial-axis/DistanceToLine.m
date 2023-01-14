function [dist,fp,success]=DistanceToLine(p,v0,v1)
    v0v1=(v1-v0);
    pv0=(v0-p);
    pv1=(v1-p);
    area = abs(norm(cross(v0v1,pv0)));
    if (norm(v0v1) > 1e-12)
        dist = area / norm(v0v1);
        t = (dot(pv0,pv0)-dot(pv0,pv1)) / dot(v0v1,v0v1);
        fp = (1-t)*v0+t*v1;
        success=true;
        return;
    end
    success=false;
end