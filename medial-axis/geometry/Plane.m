classdef Plane
    properties
        planeN
        planeD
    end
    methods
        function obj = Plane(planeN,planeD)
            obj.planeN=planeN;
            obj.planeD=planeD;
        end
        function dis = distFromPlane(obj,P)
            dis=dot(obj.planeN,P) + obj.planeD;
        end
        function outSegTips = getSegmentPlaneIntersection(plane,P1,P2)
            outSegTips=java.util.ArrayList();
            eps=0;
            d1 = plane.distFromPlane(P1);
            d2 = plane.distFromPlane(P2);
            bP1OnPlane = (abs(d1) <= eps);
            bP2OnPlane = (abs(d2) <= eps);
            if (bP1OnPlane)
                outSegTips.add(P1);
            end
            if (bP2OnPlane)
                outSegTips.add(P2);
            end
            if (d1*d2 > eps)  % points on the same side of plane
                return;
            end
            t = d1 / (d1 - d2); % 'time' of intersection point on the segment
            outSegTips.add( P1 + t * (P2- P1) );
        end
    end
end