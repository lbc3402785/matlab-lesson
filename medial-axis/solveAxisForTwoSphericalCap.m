function [project]=solveAxisForTwoSphericalCap(e,u1,cosRadian1,u2,cosRadian2,p1,p2)
    eu1=dot(e,u1);
    eu2=dot(e,u2);
    if eu1>=cosRadian1&&eu2>=cosRadian2
        project=1.0;
        return;
    end
    if eu1==-1&&eu2==-1
        project=min(-cosRadian1,-cosRadian2);
        return;
    end
    if eu1==-1
        project=-cosRadian1;
        return;
    end
    if eu2==-1
        project=-cosRadian2;
        return;
    end

    
    prj1=-1;
    det1=-1;
    if(eu1~=1)
        det1=(cosRadian1*cosRadian1-1.0)/(eu1*eu1-1.0);
    end
    if det1>=0
        %球面上有解
        a1=sqrt(det1);
        a2=-sqrt(det1);
        b1=cosRadian1-a1*eu1;
        v1=a1*e+b1*u1;
        v1=v1/norm(v1);
        if(dot(v1,u2)>=cosRadian2)
            prj1=max(b1*eu1+a1,prj1);
        end
        b2=cosRadian1-a2*eu1;
        v2=a2*e+b2*u1;
        v2=v2/norm(v2);
        if(dot(v2,u2)>=cosRadian2)
            prj1=max(b2*eu1+a2,prj1);
        end
    end

    prj2=-1;
    det2=-1;
    if(eu2~=1)
        det2=(cosRadian2*cosRadian2-1.0)/(eu2*eu2-1.0);
    end
    if det2>=0
        %球面上有解
        a1=sqrt(det2);
        a2=-sqrt(det2);
        b1=cosRadian2-a1*eu2;
        v1=a1*e+b1*u2;
        v1=v1/norm(v1);
        if(dot(v1,u1)>=cosRadian1)
            prj2=max(prj2,b1*eu2+a1);
        end
        b2=cosRadian1-a2*eu2;
        v2=a2*e+b2*u2;
        v2=v2/norm(v2);
        if(dot(v2,u1)>=cosRadian1)
            prj2=max(prj2,b2*eu2+a2);
        end
    end
    project=max(prj1,prj2);
    x0=dot(e,p1);
    x1=dot(e,p2);
    project=max(project,max(x0,x1));
end