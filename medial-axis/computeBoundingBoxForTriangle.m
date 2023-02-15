function [bottom,top]=computeBoundingBoxForTriangle(v1,v2,v3)
    bottom=[min(min(v1(1),v2(1)),v3(1)),min(min(v1(2),v2(2)),v3(2)),min(min(v1(3),v2(3)),v3(3))];
    top=[max(max(v1(1),v2(1)),v3(1)),max(max(v1(2),v2(2)),v3(2)),max(max(v1(3),v2(3)),v3(3))];
end