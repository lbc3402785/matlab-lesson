function [slabCone]=computeSlabCone(c0,r0,c1,r1)
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
        slabCone.smallCenter = c0;
        slabCone.axis = c1-c0;
        slabCone.axis=slabCone.axis/norm(slabCone.axis);
        slabCone.base = r0;
        slabCone.top = r1;
        slabCone.bigCenter=c1;
        slabCone.cosThetaSqr=1;
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
    cangle = sqrt(1.-r0*r0/vc0len/vc0len);
    slabCone.cosThetaSqr=1.-r0*r0/vc0len/vc0len;
    if (r0<r1)
        slabCone.smallCenter = slabCone.apex + apexc0 * cangle * cangle;
        slabCone.base = r0 * cangle;
        slabCone.top = r1 * cangle;
        slabCone.height = (vc1len - vc0len) * cangle * cangle;
        slabCone.bigCenter=slabCone.smallCenter+slabCone.height*slabCone.axis;
        slabCone.hmin=dot(slabCone.smallCenter-slabCone.apex,slabCone.axis);
        slabCone.hmax=slabCone.hmin+slabCone.height;
    else
        slabCone.smallCenter = slabCone.apex + apexc1 * cangle * cangle;
        slabCone.base = r1 * cangle;
        slabCone.top = r0 * cangle;
        slabCone.height = (vc0len - vc1len) * cangle * cangle;
        slabCone.bigCenter=slabCone.smallCenter+slabCone.height*slabCone.axis;
        slabCone.hmin=dot(slabCone.smallCenter-slabCone.apex,slabCone.axis);
        slabCone.hmax=slabCone.hmin+slabCone.height;
    end
end