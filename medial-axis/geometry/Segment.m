classdef Segment
    properties
        q
        r
    end
    methods
        function obj = Segment(q,r)
            obj.q=q;
            obj.r=r;
        end
        function draw(seg)
            line([seg.q(1),seg.r(1)],[seg.q(2),seg.r(2)],[seg.q(3),seg.r(3)],'LineStyle','-','LineWidth',2,'Color','magenta');
        end
        function [t,fp,dist]=project(seg,p)
            t=(dot(p-seg.q,seg.r-seg.q) / (norm(seg.r-seg.q)*norm(seg.r-seg.q)));%ͶӰ�����
            if( (t >= 0.0) && (t <= 1.0) )
                fp = (1.0-t)*seg.q + t*seg.r;%ͶӰ��
                dist = norm(p-fp);%���㵽ͶӰ�����
            elseif( t < 0.0)
                fp = seg.q;%�����
                dist = norm(p-seg.q);               
            else
                fp = seg.r;%�����
                dist = norm(p-seg.r);
            end
                
        end
    end
end