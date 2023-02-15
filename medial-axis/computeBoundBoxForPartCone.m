function [bottom,top]=computeBoundBoxForPartCone(slabCone,u,radian)
    [b1,t1]=computeBoundBoxForDiscSegment(slabCone.smallCenter,slabCone.base,slabCone.axis,u,radian);
    [b2,t2]=computeBoundBoxForDiscSegment(slabCone.bigCenter,slabCone.top,slabCone.axis,u,radian);
    [bottom,top]=BoundingBoxUnion(b1,t1,b2,t2);
% bottom=[center(1)-radius*sqrt(1-normal(1)*normal(1)),center(2)-radius*sqrt(1-normal(2)*normal(2)),center(3)-radius*sqrt(1-normal(3)*normal(3))];
% top=[center(1)+radius*sqrt(1-normal(1)*normal(1)),center(2)+radius*sqrt(1-normal(2)*normal(2)),center(3)+radius*sqrt(1-normal(3)*normal(3))];
end