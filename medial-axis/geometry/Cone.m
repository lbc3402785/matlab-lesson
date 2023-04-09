classdef Cone
    properties
        apex
        smallCenter
        axis
        base
        top
        bigCenter
        cosThetaSqr
        sinThetaSqr
        height
        hmin
        hmax
        type%1 cylinder 2 cone
    end
    methods
         % default constructor
        function cone = Cone()
            % initialization code here
            type=0;
        end
        function [fp,signeddist,seg]=project(cone,p)
            apexp = p - cone.smallCenter;%小圆圆心指向顶点p
            apexpCaxis = cross(apexp,cone.axis);%顶点和圆锥轴构成的面的法向量
            dp = dot(apexp,cone.axis);%顶点到smallCenter的轴向距离
            interior = true;
            if( (dp < 0) || (dp > cone.height) )%投影不在圆锥表面
                interior = false;
            end
            if(abs(norm(apexpCaxis)) < 1e-12)
                bw=cone.axis;
                [bu,bv]=Utils.GenerateComplementBasis(bw);
                v0 = cone.smallCenter + bv * cone.base;%小圆和bv轴的交点
                v1 = cone.smallCenter + cone.axis * cone.height + bv * cone.top;%大圆和bv轴的交点
                seg=Segment(v0,v1);
                seg.draw();
                [fp,dist]=seg.project(p);%顶点在线段上的投影
                if(~interior)
                    signeddist=dist;
                else
                    signeddist=-dist;
                end
            else
                if(interior)
                    cone_dist_to_axis = dp/cone.height * cone.top + (cone.height-dp)/cone.height * cone.base;
                    seg=Segment(cone.smallCenter,cone.smallCenter+cone.axis*cone.height);
                    seg.draw();
                    [tfp,dist_to_axis]=seg.project(p);
                    if(dist_to_axis > cone_dist_to_axis)
                        %顶点到轴的距离大于投影点到轴的距离，说明顶点在圆锥外部
                        interior = false;
                    end
                end
                apexp = apexp - dot(apexp,cone.axis)*cone.axis;
                apexp=apexp/norm(apexp);
                v0 = cone.smallCenter + apexp * cone.base;%小圆心沿apexp在圆锥表面的投影点
                v1 = cone.smallCenter + cone.axis * cone.height + apexp * cone.top;%大圆心沿apexp在圆锥表面的投影点
                seg=Segment(v0,v1);
                seg.draw();
                [fp,dist]=seg.project(p);%计算投影点
                if(interior)
                    signeddist = -dist;%在圆锥内部，有向距离设置为负值
                else
                    signeddist = dist;%在圆锥内部，有向距离设置为正值
                end
            end
        end
        function [interior]=contains(cone,v)
            if cone.type==0
                error('invalid cone!');
            end
            u=v-cone.apex;
            h=dot(cone.axis,u);
            if(cone.HeightInRange(h))
                if cone.type==1
                    %cylinder
                    u=u-h*cone.axis;
                    interior=(norm(u)*norm(u)<cone.base*cone.base);
                else
                    interior=((h*h-cone.cosThetaSqr*norm(u)*norm(u))>0);
                end
            else
                interior=false;
            end
        end
        function [interior]=HeightInRange(cone,h)
            if cone.hmin<h&&h<cone.hmax
                interior=true;
            else
                interior=false;
            end
        end
    end
end
% define a non-member function
