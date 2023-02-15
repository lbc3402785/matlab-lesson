function [check]=isSlabConeContainVertice(slabCone,v)
    check=false;
    u=v-slabCone.apex;
    h=dot(slabCone.axis,u);
    check=HeightInRange(slabCone,h);
    if ~check
        return;
    end
    if slabCone.type==1
        u=u-h*slabCone.axis;
        check=(norm(u)<=slabCone.base);
    else
        Q=dot(slabCone.axis,u)*dot(slabCone.axis,u)-slabCone.cosThetaSqr*dot(u,u);
        check=(Q>0); 
    end
   
end
function [check]=HeightInRange(slabCone,h)
    check= (slabCone.hmin<h&&h<slabCone.hmax);
end