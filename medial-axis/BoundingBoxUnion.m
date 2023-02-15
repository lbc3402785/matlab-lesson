function [b,t]=BoundingBoxUnion(b1,t1,b2,t2)
    b=[min(b1(1),b2(1)),min(b1(2),b2(2)),min(b1(3),b2(3))];
    t=[max(t1(1),t2(1)),max(t1(2),t2(2)),max(t1(3),t2(3))];
end