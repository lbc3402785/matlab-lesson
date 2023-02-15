function [outSegTips]=trianglePlaneIntersection(plane,tri)
    outSegTips1=plane.getSegmentPlaneIntersection(tri.v1,tri.v2);
    outSegTips2=plane.getSegmentPlaneIntersection(tri.v2,tri.v3);
    outSegTips3=plane.getSegmentPlaneIntersection(tri.v3,tri.v1);
    outSegTips=java.util.ArrayList();
    outSegTips.addAll(outSegTips1);
    outSegTips.addAll(outSegTips2);
    outSegTips.addAll(outSegTips3);
    if(outSegTips.size()>2)
        disp('duplicate element');
    end      
end