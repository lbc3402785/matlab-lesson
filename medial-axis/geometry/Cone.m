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
            apexp = p - cone.smallCenter;%СԲԲ��ָ�򶥵�p
            apexpCaxis = cross(apexp,cone.axis);%�����Բ׶�ṹ�ɵ���ķ�����
            dp = dot(apexp,cone.axis);%���㵽smallCenter���������
            interior = true;
            if( (dp < 0) || (dp > cone.height) )%ͶӰ����Բ׶����
                interior = false;
            end
            if(abs(norm(apexpCaxis)) < 1e-12)
                bw=cone.axis;
                [bu,bv]=Utils.GenerateComplementBasis(bw);
                v0 = cone.smallCenter + bv * cone.base;%СԲ��bv��Ľ���
                v1 = cone.smallCenter + cone.axis * cone.height + bv * cone.top;%��Բ��bv��Ľ���
                seg=Segment(v0,v1);
                seg.draw();
                [fp,dist]=seg.project(p);%�������߶��ϵ�ͶӰ
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
                        %���㵽��ľ������ͶӰ�㵽��ľ��룬˵��������Բ׶�ⲿ
                        interior = false;
                    end
                end
                apexp = apexp - dot(apexp,cone.axis)*cone.axis;
                apexp=apexp/norm(apexp);
                v0 = cone.smallCenter + apexp * cone.base;%СԲ����apexp��Բ׶�����ͶӰ��
                v1 = cone.smallCenter + cone.axis * cone.height + apexp * cone.top;%��Բ����apexp��Բ׶�����ͶӰ��
                seg=Segment(v0,v1);
                seg.draw();
                [fp,dist]=seg.project(p);%����ͶӰ��
                if(interior)
                    signeddist = -dist;%��Բ׶�ڲ��������������Ϊ��ֵ
                else
                    signeddist = dist;%��Բ׶�ڲ��������������Ϊ��ֵ
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
