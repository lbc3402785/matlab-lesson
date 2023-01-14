function [slabCone]=computeSlabCone(c0,r0,c1,r1)
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
        height = (vc1len - vc0len) * cangle * cangle;
        slabCone.bigCenter=slabCone.smallCenter+height*slabCone.axis;
    else
        slabCone.smallCenter = slabCone.apex + apexc1 * cangle * cangle;
        slabCone.base = r1 * cangle;
        slabCone.top = r0 * cangle;
        height = (vc0len - vc1len) * cangle * cangle;
        slabCone.bigCenter=slabCone.smallCenter+height*slabCone.axis;
    end
end