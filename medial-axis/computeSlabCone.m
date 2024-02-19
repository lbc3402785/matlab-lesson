function [slabCone]=computeSlabCone(c0,r0,c1,r1)
    slabCone=Cone(c0,r0,c1,r1);
    c02c1 = c1-c0;
    if (norm(c02c1) - abs(r1 - r0) < 1e-8)
        disp('one sphere is included in another sphere!');
        return;
    end
    if (norm(c02c1) < 1e-8)
        disp('two sphere coincide!');
        return;
    end
    dr0r1 = abs(r0-r1);
    if (dr0r1 < 1e-8)
        slabCone.apex=c0;
        slabCone.smallCircleCenter = c0;
        slabCone.smallCenter=c0;
        slabCone.smallRadius=r0;
        slabCone.axis = c1-c0;
        slabCone.axis=slabCone.axis/norm(slabCone.axis);
        slabCone.base = r0;
        slabCone.top = r1;
        slabCone.bigCircleCenter=c1;
        slabCone.bigCenter=c1;
        slabCone.bigRadius=r1;
        slabCone.cosThetaSqr=1;
        slabCone.sinThetaSqr=0;
        slabCone.height = norm(slabCone.axis);
        slabCone.hmin =0;
        slabCone.hmax =slabCone.height;
        slabCone.type=1;
        return;
    end
    slabCone.type=2;
    slabCone.apex=(r1 * c0 - r0 * c1) / (r1 - r0);
    slabCone.axis=c1-c0;
    if (r0>r1)
        slabCone.axis=c0-c1;
    end
    slabCone.axis=slabCone.axis/norm(slabCone.axis);
    apexc0 = c0 - slabCone.apex;
    apexc1 = c1 - slabCone.apex;
    vc0len =norm(apexc0);
    vc1len =norm(apexc1);
    if (r0<r1)
        cangle = sqrt(1.-r1*r1/vc1len/vc1len);
        slabCone.cosThetaSqr=1.-r1*r1/vc1len/vc1len;
        slabCone.sinThetaSqr=r1*r1/vc1len/vc1len;
    else
        cangle = sqrt(1.-r0*r0/vc0len/vc0len);
        slabCone.cosThetaSqr=1.-r0*r0/vc0len/vc0len;
        slabCone.sinThetaSqr=r0*r0/vc0len/vc0len;
    end
    
    if (r0<r1)
        slabCone.smallCircleCenter = slabCone.apex + apexc0 * cangle * cangle;
        slabCone.smallCenter=c0;
        slabCone.smallRadius=r0;
        slabCone.base = r0 * cangle;
        slabCone.top = r1 * cangle;
        slabCone.height = (vc1len - vc0len) * cangle * cangle;
        slabCone.bigCircleCenter=slabCone.smallCircleCenter+slabCone.height*slabCone.axis;
        slabCone.bigCenter=c1;
        slabCone.bigRadius=r1;
        slabCone.hmin=dot(slabCone.smallCircleCenter-slabCone.apex,slabCone.axis);
        slabCone.hmax=slabCone.hmin+slabCone.height;
    else
        slabCone.smallCircleCenter = slabCone.apex + apexc1 * cangle * cangle;
        slabCone.smallCenter=c1;
        slabCone.smallRadius=r1;
        slabCone.base = r1 * cangle;
        slabCone.top = r0 * cangle;
        slabCone.height = (vc0len - vc1len) * cangle * cangle;
        slabCone.bigCircleCenter=slabCone.smallCircleCenter+slabCone.height*slabCone.axis;
        slabCone.bigCenter=c0;
        slabCone.bigRadius=r0;
        slabCone.hmin=dot(slabCone.smallCircleCenter-slabCone.apex,slabCone.axis);
        slabCone.hmax=slabCone.hmin+slabCone.height;
    end
end