classdef Bounds3
    properties
        pMin=Inf(1,3);
        pMax=-Inf(1,3);
    end
    methods
        function obj = Bounds3(pMin,pMax)
            obj.pMin=pMin;
            obj.pMax=pMax;
        end
        function d=Diagonal(bd)
            d=bd.pMax-bd.pMin;
        end
        function index=maxExtent(bd)
            d = Diagonal(bd);
            if (d(1) > d(2) && d(1) > d(3))
                index=1;
                return;
            elseif (d(2) > d(3))
                index=2;
                return;
            else
                index=3;
                return;
            end
        end
        function center=Centroid(bd)
            center=bd.pMin*0.5 +  bd.pMax*0.5;
        end
        function bd=Intersect(bd1,bd2)
            pMin=[max(bd1.pMin(1), bd2.pMin(1)),max(bd1.pMin(2), bd2.pMin(2)),max(bd1.pMin(3), bd2.pMin(3))];
            pMax=[min(bd1.pMax(1), bd2.pMax(1)),min(bd1.pMax(2), bd2.pMax(2)),min(bd1.pMax(3), bd2.pMax(3))];
            bd=Bounds3(pMin,pMax);
        end
        function bd=Union(bd1,bd2)
            pMin=[min(bd1.pMin(1), bd2.pMin(1)),min(bd1.pMin(2), bd2.pMin(2)),min(bd1.pMin(3), bd2.pMin(3))];
            pMax=[max(bd1.pMax(1), bd2.pMax(1)),max(bd1.pMax(2), bd2.pMax(2)),max(bd1.pMax(3), bd2.pMax(3))];
            bd=Bounds3(pMin,pMax);
        end
        function check=Inside(bd,p)
            check= (p(1) >= bd.pMin(1) && p(1) <= bd.pMax(1) && p(2) >= bd.pMin(2) && ...
                p(2) <= bd.pMax(2) && p(3)>= bd.pMin(3) && p(3) <= bd.pMax(3));
        end
        function check=IntersectP(bd,seg)
            for i=1:3 
                w = bd.pMin(i); % min: lower left
                if ( (seg.q(i) < w) && (seg.r(i) < w) ) 
                    check=false;
                    return;
                end
                w = bd.pMax(i); % max: upper right 
                if ( (seg.q(i) > w) && (seg.r(i) > w) ) 
                    check=false;
                    return;
                end
            end
            check=true;
        end
    end

end