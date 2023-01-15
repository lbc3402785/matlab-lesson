function [project]=solveAxisForSphericalCap(e,u,cosRadian)
    eu=dot(e,u);
    if eu>=cosRadian
        project=1.0;
        return;
    end
    if (eu==-1)
        project=-cosRadian;
        return;
    end
    det=(cosRadian*cosRadian-1.0)/(eu*eu-1.0);
    if det>=0
        %球面上有解
        a=sqrt(det);
        x0=(cosRadian-a*eu)*eu+a;
        x1=(cosRadian+a*eu)*eu-a;
        project=max(x0,x1);
    end
end