function [b,t]=BoundingBoxIntersection(b1,t1,b2,t2)
    b=[max(b1(1),b2(1)),max(b1(2),b2(2)),max(b1(3),b2(3))];
    t=[min(t1(1),t2(1)),min(t1(2),t2(2)),min(t1(3),t2(3))];
end