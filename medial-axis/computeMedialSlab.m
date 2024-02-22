function [slab,success]=computeMedialSlab(c1,c2,c3,r1,r2,r3)
    slab=Slab(c1,c2,c3,r1,r2,r3);
    
    pos=[c1;c2;c3];
    radius=[r1;r2;r3];
    if radius(1)<radius(2)
        tmp=pos(1,:);
        pos(1,:)=pos(2,:);
        pos(2,:)=tmp;
        tmpR=radius(1);
        radius(1)=radius(2);
        radius(2)=tmpR;
    end
    if radius(1)<radius(3)
        tmp=pos(1,:);
        pos(1,:)=pos(3,:);
        pos(3,:)=tmp;
        tmpR=radius(1);
        radius(1)=radius(3);
        radius(3)=tmpR;
    end
    [slab.n0,slab.n1,success]=TriangleFromThreeSpheres(pos(1,:),radius(1),pos(2,:),radius(2,:),pos(3,:),radius(3));
    if(dot(slab.n0,slab.tri.normal)<0)
        tmp=slab.n0;
        slab.n0=slab.n1;
        slab.n1=tmp;
    end
    [slab.slabCone12]=computeSlabCone(c1,r1,c2,r2);
    [slab.slabCone13]=computeSlabCone(c1,r1,c3,r3);
    [slab.slabCone23]=computeSlabCone(c2,r2,c3,r3);
    slab.V1_UP=c1+r1*slab.n0;
    slab.V1_DOWN=c1+r1*slab.n1;
    slab.V2_UP=c2+r2*slab.n0;
    slab.V2_DOWN=c2+r2*slab.n1;
    slab.V3_UP=c3+r3*slab.n0;
    slab.V3_DOWN=c3+r3*slab.n1;
    slab.st0=Triangle( slab.V1_UP, slab.V2_UP, slab.V3_UP);
    %保证三角形法向朝外
    slab.st1=Triangle( slab.V1_DOWN, slab.V3_DOWN, slab.V2_DOWN);

end