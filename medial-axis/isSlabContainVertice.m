function [check]=isSlabContainVertice(c1,c2,c3,r1,r2,r3,v)
    check=(norm(v-c1)<=r1);
    if check
        return;
    end
    check=(norm(v-c2)<=r2);
    if check
        return;
    end
    check=(norm(v-c3)<=r3);
    if check
        return;
    end
    [slab,success]=computeMedialSlab(c1,c2,c3,r1,r2,r3);
    if ~success
        error('compute medial slab error!');
    end
    [check]=isSlabConeContainVertice(slab.slabCone12,v);
    if check
        return;
    end
    [check]=isSlabConeContainVertice(slab.slabCone13,v);
    if check
        return;
    end
    [check]=isSlabConeContainVertice(slab.slabCone23,v);
    if check
        return;
    end
    up=Triangle(slab.st0.v0,slab.st0.v1,slab.st0.v2);
    down=Triangle(slab.st1.v0,slab.st1.v1,slab.st1.v2);
    tri=Triangle(slab.V1_UP,slab.V2_UP,slab.V3_UP);
    triangles=[up,down];
    if(dot(tri.normal,up.normal)>0)
        %ƒÊ ±’Î
        %===============================
        tmp=Triangle(slab.V1_UP,slab.V1_DOWN,slab.V2_UP);
        triangles=[triangles,tmp];
        tmp=Triangle(slab.V2_UP,slab.V1_DOWN,slab.V2_DOWN);
        triangles=[triangles,tmp];
        %===============================
        tmp=Triangle(slab.V2_UP,slab.V2_DOWN,slab.V3_UP);
        triangles=[triangles,tmp];
        tmp=Triangle(slab.V3_UP,slab.V2_DOWN,slab.V3_DOWN);
        triangles=[triangles,tmp];
        %===============================
        tmp=Triangle(slab.V3_UP,slab.V3_DOWN,slab.V1_UP);
        triangles=[triangles,tmp];
        tmp=Triangle(slab.V1_UP,slab.V3_DOWN,slab.V1_DOWN);
        triangles=[triangles,tmp];
    else
         %À≥ ±’Î
        %===============================
        tmp=Triangle(slab.V1_UP,slab.V2_UP,slab.V2_DOWN);
        triangles=[triangles,tmp];
        tmp=Triangle(slab.V1_UP,slab.V2_DOWN,slab.V1_DOWN);
        triangles=[triangles,tmp];
        %===============================
        tmp=Triangle(slab.V2_UP,slab.V3_UP,slab.V3_DOWN);
        triangles=[triangles,tmp];
        tmp=Triangle(slab.V2_UP,slab.V3_DOWN,slab.V2_DOWN);
        triangles=[triangles,tmp];
        %===============================
        tmp=Triangle(slab.V3_UP,slab.V1_UP,slab.V1_DOWN);
        triangles=[triangles,tmp];
        tmp=Triangle(slab.V3_UP,slab.V1_DOWN,slab.V3_DOWN);
        triangles=[triangles,tmp];
    end
    poly=Polyhedron(triangles);
    char=poly.InPolyhedron(v);
    if char=='o'
        check=false;
    else
        check=true;
    end
end