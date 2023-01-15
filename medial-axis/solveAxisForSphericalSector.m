function [project]=solveAxisForSphericalSector(e,u,cosRadian)
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
        result=max(x0,x1);
        if result<0
            project=0;
        elseif result>1.0
            project=1.0;
        else 
            project=result;
        end
    else
        %球面上无解，考虑锥顶点的值
        project=0;
    end
end