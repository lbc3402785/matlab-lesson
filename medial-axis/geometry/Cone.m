classdef Cone
    properties
        apex
        smallCircleCenter
        axis
        base
        top
        bigCircleCenter
        cosThetaSqr
        sinThetaSqr
        height
        hmin
        hmax
        type%1 cylinder 2 cone
        smallCenter
        bigCenter
        smallRadius
        bigRadius
    end
    methods
         % default constructor
        function cone = Cone(c0,r0,c1,r1)
            % initialization code here
            cone.type=0;
        end
        function [c,r,fp,signeddist,seg]=project(cone,p)
            apexp = p - cone.smallCircleCenter;%小圆圆心指向顶点p
            apexpCaxis = cross(apexp,cone.axis);%顶点和圆锥轴构成的面的法向量
            dp = dot(apexp,cone.axis);%顶点到smallCircleCenter的轴向距离
            if(abs(norm(apexpCaxis)) < 1e-12)
                bw=cone.axis;
                [bu,bv]=Utils.GenerateComplementBasis(bw);
                v0 = cone.smallCircleCenter + bv * cone.base;%小圆和bv轴的交点
                v1 = cone.bigCircleCenter + bv * cone.top;%大圆和bv轴的交点
                
            else
                apexp = apexp - dot(apexp,cone.axis)*cone.axis;
                apexp=apexp/norm(apexp);
                v0 = cone.smallCircleCenter + apexp * cone.base;%小圆心沿apexp在圆锥表面的投影点
                v1 = cone.bigCircleCenter + apexp * cone.top;%大圆心沿apexp在圆锥表面的投影点
            end
            seg=Segment(v0,v1);

            l=norm(v1-v0);
            pl=dot(p-v0,v1-v0)/l;
            if( (pl < 0) || (pl > l) )
                if(pl<0)
                    %小球面的距离
                    sph=Sphere(cone.smallCenter,cone.smallRadius);
                    [fp,signeddist]=sph.project(p);
                    c=cone.smallCenter;
                    r=cone.smallRadius;
                    
                else
                    %大球面的距离
                    sph=Sphere(cone.bigCenter,cone.bigRadius);
                    [fp,signeddist]=sph.project(p);
                    c=cone.bigCenter;
                    r=cone.bigRadius;   
                end
            else
                %fp = (1.0-t)*v0+ t*v1;
                [t,fp,dist]=seg.project(p);%顶点在线段上的投影
                
                if(cone.type==1)
                    
                    c=(1.0-t)*cone.smallCircleCenter+ t*cone.bigCircleCenter;
                    r=(1.0-t)*cone.base+ t*cone.top;
                    d=norm(p-c);
                    if(d>r)
                        signeddist=dist;
                    else
                        signeddist=-dist;
                    end
                else
                    %不需要考虑球
                    cone_dist_to_axis = dp/cone.height * cone.top + (cone.height-dp)/cone.height * cone.base;
                    seg=Segment(cone.smallCircleCenter,cone.smallCircleCenter+cone.axis*cone.height);
                    seg.draw();
                    [~,~,dist_to_axis]=seg.project(p);
                    if(dist_to_axis>cone_dist_to_axis)
                        %在圆锥外面
                        signeddist=dist;
                    else
                        %在圆锥内部
                        signeddist=-dist;
                    end
                    r=norm(fp-cone.apex)*sqrt(cone.sinThetaSqr/cone.cosThetaSqr);
                    w0=(r-cone.smallRadius)/(cone.bigRadius-cone.smallRadius);
                    w1=1-w0;
                    c=w0*cone.bigCenter+w1*cone.smallCenter;
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
