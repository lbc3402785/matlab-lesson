classdef Slab
    properties
        c1
        c2
        c3
        r1
        r2
        r3
        slabCone12
        slabCone13
        slabCone23
        st0%与默认法向朝向一致
        st1
        n0
        n1
        V1_UP
        V2_UP
        V3_UP
        V1_DOWN
        V2_DOWN
        V3_DOWN
        cv12
        cv13
        cv23
        radian12
        radian13
        radian23
        tri
        
    end
    methods
        function obj = Slab(c1,c2,c3,r1,r2,r3)
            obj.c1=c1;
            obj.c2=c2;
            obj.c3=c3;
            obj.r1=r1;
            obj.r2=r2;
            obj.r3=r3;
            obj.tri=Triangle(c1,c2,c3);
        end
        function c=center(slab)
            c=(slab.c1+slab.c2+slab.c3)/3;
        end
        
        function [success]=InTopPentahedron(slab,p)
            if(dot(slab.tri.normal,p-slab.tri.v1)<0)
                success=false;
                return;
            end
            if(dot(slab.st0.normal,p-slab.st0.v1)>0)
                success=false;
                return;
            end
            n12=cross(slab.tri.v2-slab.tri.v1,slab.n0);%超外侧
            if(dot(n12,p-slab.tri.v1)>0)
                success=false;
                return;
            end
            
            n23=cross(slab.tri.v3-slab.tri.v2,slab.n0);%超外侧
            if(dot(n23,p-slab.tri.v2)>0)
                success=false;
                return;
            end
            
            n31=cross(slab.tri.v1-slab.tri.v3,slab.n0);%超外侧
            if(dot(n31,p-slab.tri.v3)>0)
                success=false;
                return;
            end
            success=true;
        end
        
        function [success]=InBottomPentahedron(slab,p)
            if(dot(slab.tri.normal,p-slab.tri.v1)>0)
                success=false;
                return;
            end
            if(dot(slab.st1.normal,p-slab.st1.v1)>0)
                success=false;
                return;
            end
            n12=cross(slab.n1,slab.tri.v2-slab.tri.v1);%超外侧
            if(dot(n12,p-slab.tri.v1)>0)
                success=false;
                return;
            end
            
            n23=cross(slab.n1,slab.tri.v3-slab.tri.v2);%超外侧
            if(dot(n23,p-slab.tri.v2)>0)
                success=false;
                return;
            end
            
            n31=cross(slab.n1,slab.tri.v1-slab.tri.v3);%超外侧
            if(dot(n31,p-slab.tri.v3)>0)
                success=false;
                return;
            end
            success=true;
        end
        
        function [u,v,w,fp,signeddist]=project(slab,p)
            if(dot(slab.tri.normal,p-slab.tri.v1)>=0)
                %上半部分
                tri1=slab.st0;
                [u1,v1,w1,fp1,signeddist1]=tri1.project(p);
                success1=(u1>=0&&u1<=1&&v1>=0&&v1<=1&&w1>=0&&w1<=1);
                if success1
                    if(dot(p-fp1,tri1.normal)<0)
                        signeddist1=signeddist1*(-1);
                    end
                    fp=fp1;
                    u=u1;
                    v=v1;
                    w=w1;
                    signeddist=signeddist1;
                    return;
                end
            else
                %下半部分
                tri2=slab.st1;
                [u2,v2,w2,fp2,signeddist2]=tri2.project(p);

                success2=(u2>=0&&u2<=1&&v2>=0&&v2<=1&&w2>=0&&w2<=1);
                if success2
                    if(dot(p-fp2,tri2.normal)<0)
                        signeddist2=signeddist2*(-1);
                    end
                    fp=fp2;
                    u=u2;
                    v=v2;
                    w=w2;
                    signeddist=signeddist2;
                    return;
                end
            end
            [c12,r12,fp12,signeddist12,~]=slab.slabCone12.project(p);
            [c13,r13,fp13,signeddist13,~]=slab.slabCone13.project(p);
            [c23,r23,fp23,signeddist23,~]=slab.slabCone23.project(p);
            if(abs(signeddist12)<=abs(signeddist13)&&abs(signeddist12)<=abs(signeddist23))
                fp=fp12;
                signeddist=signeddist12;
                u=1-norm(c12-slab.c1)/norm(slab.c2-slab.c1);
                v=1-u;
                w=0;
            elseif(abs(signeddist12)>=abs(signeddist13)&&abs(signeddist13)<=abs(signeddist23))
                fp=fp13;
                signeddist=signeddist13;
                u=1-norm(c13-slab.c1)/norm(slab.c3-slab.c1);
                v=0;
                w=1-u;
            else
                fp=fp23;
                signeddist=signeddist23;
                u=0;
                v=1-norm(c23-slab.c2)/norm(slab.c3-slab.c2);
                w=1-v;
            end 
        end
        
    end
end