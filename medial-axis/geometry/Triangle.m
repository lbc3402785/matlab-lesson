classdef Triangle
    properties
        v1
        v2
        v3
        e1
        e2
        normal
    end
    methods
        function obj = Triangle(v1,v2,v3)
            obj.v1=v1;
            obj.v2=v2;
            obj.v3=v3;
            obj.e1=v2-v1;
            obj.e2=v3-v1;
            obj.normal=cross(obj.e1,obj.e2);
            obj.normal=obj.normal/norm(obj.normal);
        end
        function c=center(tri)
            c=(tri.v1+tri.v2+tri.v3)/3;
        end
        function [c,r]=inscribedCircle(tri)
            a=norm(tri.v2-tri.v3);
            b=norm(tri.v3-tri.v1);
            c=norm(tri.v1-tri.v2);
            Perimeter=a+b+c;
            p=Perimeter/2;
            S=sqrt(p*(p-a)*(p-b)*(p-c));
            r=S/p;
            c=(tri.v1*a+tri.v2*b+tri.v3*c)/Perimeter;
        end
        function [bd]=getBounds(tri)
            bottom=tri.v1;
            top=tri.v1;
            bottom=[min(bottom(1),tri.v2(1)),min(bottom(2),tri.v2(2)),min(bottom(3),tri.v2(3))];
            bottom=[min(bottom(1),tri.v3(1)),min(bottom(2),tri.v3(2)),min(bottom(3),tri.v3(3))];
            
            top=[max(top(1),tri.v2(1)),max(top(2),tri.v2(2)),max(top(3),tri.v2(3))];
            top=[max(top(1),tri.v3(1)),max(top(2),tri.v3(2)),max(top(3),tri.v3(3))];
            bd=Bounds3(bottom,top);
        end
        function [fp]=projToTri(tri,p)
            p2p1=tri.v2-tri.v1;
            p3p2=tri.v3-tri.v2;
            p1p3=tri.v1-tri.v3;
            s1=dot(cross(p2p1,(p-tri.v1)),tri.normal);
            if(s1>=0)
                s2=dot(cross(p3p2,(p-tri.v2)),tri.normal);
                s3=dot(cross(p1p3,(p-tri.v3)),tri.normal);
                if(s2>=0&&s3>=0)
                    seg12=Segment(tri.v1,tri.v2);
                    if(norm(tri.normal)==0)
                        [t,fp,dist]=project(seg12,p);
                        return;
                    end
                    proj=dot((p-tri.v3),tri.normal);
                    fp=p-(proj/norm(tri.normal))*tri.normal;
                    return;
                end
                if(s3<0&&(s2>=0||dot(p-tri.v3,-p1p3)>=0))
                    seg13=Segment(tri.v1,tri.v3);
                    [t,fp,dist]=project(seg13,p);
                    return;
                end
                seg23=Segment(tri.v2,tri.v3);
                [t,fp,dist]=project(seg23,p);
                return;
            end
            if(dot(p-tri.v1,p2p1)<0)
                seg31=Segment(tri.v3,tri.v1)
                [t,fp,dist]=project(seg31,p);
                return
            end
            if(dot(p-tri.v2,p2p1)>0)
                seg23=Segment(tri.v2,tri.v3);
                [t,fp,dist]=project(seg23,p);
                return
            end
            seg12=Segment(tri.v1,tri.v2);
            [t,fp,dist]=project(seg12,p);
            return
        end
        function [u,v,w,fp,signeddist]=project(tri,p)
            fp=p-dot((p-tri.v1),tri.normal)*tri.normal;
            m=0;
            biggest = 0.0;  % Largest component of normal vector. %
            for i=1:3 
                t =abs( tri.normal(i) );
                if ( t > biggest ) 
                    biggest = t;
                    m = i;
                end
            end
            code=InTri3D(tri,m,fp);
            if(code ~='0')
                signeddist = norm(fp-p);
                [u,v,w]=tri.getBarycentrics(p);
            else
                se12=Segment(tri.v1,tri.v2);
                se13=Segment(tri.v1,tri.v3);
                se23=Segment(tri.v2,tri.v3);
                
                [t1,fp12,dist12]=se12.project(p);
                [t2,fp13,dist13]=se13.project(p);
                [t3,fp23,dist23]=se23.project(p);
                [u,v,w]=tri.getBarycentrics(p);
                if ( (dist12 <= dist13) && (dist13 <= dist23) )
                    signeddist = dist12;
                    fp = fp12;
                elseif( (dist13 <= dist12) && (dist13 <= dist23) )
                    signeddist = dist13;
                    fp = fp13;
                else
                    signeddist = dist23;
                    fp = fp23;
                end
            end
        end
        function draw(tri,alpha)
            % 设置默认值
            if nargin < 2
                alpha = 1.0; % 默认值
            end
            P=transpose([tri.v1;tri.v2;tri.v3]);
            X=P(1,:);
            Y=P(2,:);
            Z=P(3,:);
            T=[1,2,3];
            % trisurf(T,X,Y,Z,'FaceColor',[0,0.69,0.941],'FaceAlpha',1);
            % trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
            trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',alpha);
            hold on;
        end
        function drawInscribedCircle(tri)
            [c,r]=inscribedCircle(tri);
            u=tri.v1-tri.v2;
            u=u/norm(u);
            drawCircle(c,u,tri.normal,r);
        end
        function [u,v,w]=getBarycentrics(tri,p)
            area1=dot(cross(tri.v2-p,tri.v3-p),tri.normal);
            area2=dot(cross(tri.v3-p,tri.v1-p),tri.normal);
            area3=dot(cross(tri.v1-p,tri.v2-p),tri.normal);
            sum=area1+area2+area3;
            u=area1/sum;
            v=area2/sum;
            w=area3/sum;
        end
        function [inter]=getIntersectionOfRay(tri,ray,varargin)
            p = inputParser;            % 函数的输入解析器
            addParameter(p,'ignoreDirection',false);      % 设置变量名和默认参数
            parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
            inter.happened = false;
            if (~p.Results.ignoreDirection&&dot(ray.direction, tri.normal) > 0)
                return;
            end
            pvec = cross(ray.direction, tri.e2);%S1=DxE2
            det = dot(tri.e1, pvec);%S1\cdot E1
            if (abs(det) < 0.0001)
                return;
            end
            det_inv = 1.0 / det;
            tvec = ray.origin - tri.v1;
            u = dot(tvec, pvec) * det_inv;
            if (u < 0 || u > 1)
                return;
            end
            qvec = cross(tvec, tri.e1);
            v = dot(ray.direction, qvec) * det_inv;
            if (v < 0 || u + v > 1)
                return;
            end
            t_tmp = dot(tri.e2, qvec) * det_inv;
            if (t_tmp <= 0)
                return;
            end
            inter.happened = true;
            inter.distance = t_tmp;
            inter.coords =ray.origin+ray.direction*t_tmp;
        end
        function [code,p]=SegTri(tri,seg)
            [code,p,m]=SegPlane(tri,seg);
            if( code == '0')
                return;
            elseif ( code == 'q')%q在三角形所在平面
                code=InTri3D( tri,m,seg.q );%返回q在三角形的位置关系：内部、边上、点上或者外部
                return;
            elseif ( code == 'r')%r在三角形所在平面
                code=InTri3D( tri,m,seg.r);%返回r在三角形的位置关系：内部、边上、点上或者外部
                return;
            elseif ( code == 'p' )%线段在三角形所在平面上
                return;
            elseif ( code == '1' )%线段和三角形所在平面相交
                code=SegTriCross(tri,seg);%返回线段在三角形的位置关系
                return;
            else % Error */
                return;
            end
        end
        function [char]=SegTriCross(tri,seg)
            vol0 = Triangle.VolumeSign( seg.q, tri.v1, tri.v2, seg.r );
            vol1 = Triangle.VolumeSign( seg.q, tri.v2, tri.v3, seg.r );
            vol2 = Triangle.VolumeSign( seg.q, tri.v3, tri.v1, seg.r );
            % Same sign: segment intersects interior of triangle. 
            if ( ( ( vol0 > 0 ) && ( vol1 > 0 ) && ( vol2 > 0 ) ) || ...
                 ( ( vol0 < 0 ) && ( vol1 < 0 ) && ( vol2 < 0 ) ) )
                char='f';
                return;
            end
            % Opposite sign: no intersection between segment and triangle
            if ( ( ( vol0 > 0 ) || ( vol1 > 0 ) || ( vol2 > 0 ) ) && ...
                ( ( vol0 < 0 ) || ( vol1 < 0 ) || ( vol2 < 0 ) ) )
                char='0';
                return;
            elseif ( ( vol0 == 0 ) && ( vol1 == 0 ) && ( vol2 == 0 ) )
                error('Error 1 in SegTriCross');
            %Two zeros: segment intersects vertex.
            elseif ( ( ( vol0 == 0 ) && ( vol1 == 0 ) ) || ...
              ( ( vol0 == 0 ) && ( vol2 == 0 ) ) || ...
              ( ( vol1 == 0 ) && ( vol2 == 0 ) ) )
                char='v';
                return;
            %One zero: segment intersects edge.
            elseif ( ( vol0 == 0 ) || ( vol1 == 0 ) || ( vol2 == 0 ) )
                char='e';
                return;
            else
                error('Error 2 in SegTriCross');
            end
        end
        function [char]=InTri3D(tri,m,p)
            j=1;
            Tp0=[0,0];
            Tp1=[0,0];
            Tp2=[0,0];
            pp=[0,0];
            for i=1:3
                if(i~=m)
                    pp(j)=p(i);
                    Tp0(j)=tri.v1(i);
                    Tp1(j)=tri.v2(i);
                    Tp2(j)=tri.v3(i);
                    j=j+1;
                end
            end
            char=Triangle.InTri2D(Tp0,Tp1,Tp2,pp);
        end
        function [char,p,m]=SegPlane(tri,seg)
            p=[0,0,0];
            [m,D]=PlaneCoeff(tri);
            num = D - dot( seg.q, tri.normal );
            rq=seg.r-seg.q;
            denom = dot( rq, tri.normal );
            if ( denom == 0.0 )   % Segment is parallel to plane. */
                if ( num == 0.0 )   % q is on plane. */
                    char='p';
                    return;
                else
                    char='0';%线段在平面一侧
                    return;
                end
           else
                t = num / denom;
           end
           p=seg.q+t*rq;
           if ( (0.0 < t) && (t < 1.0) )
                char='1';
                return;
           elseif (num == 0.0)% t == 0 */
                char='q';
                return;
           elseif (num == denom)% t == 1 */
                char='r';
                return;
            
           else
                char='0';%线段在平面一侧
                return;
           end
        end
        function [m,D]=PlaneCoeff(tri)
            D=dot(tri.v1,tri.normal);
            biggest = 0.0;
            m = 0;
            for i=1:3
                t =abs( tri.normal(i) );
                if ( t > biggest )
                    m=i;
                end
            end
        end
    end
    methods(Static)
        function [result]=VolumeSign(a,b,c,d)
            ax = a(1);
            ay = a(2);
            az = a(3);
            bx = b(1);
            by = b(2);
            bz = b(3);
            cx = c(1);
            cy = c(2);
            cz = c(3);
            dx = d(1);
            dy = d(2);
            dz = d(3);
            bxdx=bx-dx;
            bydy=by-dy;
            bzdz=bz-dz;
            cxdx=cx-dx;
            cydy=cy-dy;
            czdz=cz-dz;
            vol =   (az-dz) * (bxdx*cydy - bydy*cxdx) ...
            + (ay-dy) * (bzdz*cxdx - bxdx*czdz) ...
            + (ax-dx) * (bydy*czdz - bzdz*cydy);
            if  ( vol > 0.0 )   
                result= 1;
            elseif ( vol < 0.0 )   
                result= -1;
            else
                result=0;
            end
        end
        function [result]=AreaSign(a,b,c)
            area2 = ( b(1) - a(1) ) * ( c(2) - a(2) ) - ...
            ( c(1) - a(1) ) * ( b(2) - a(2) );%(b-a)x(c-a)
            %The area should be an integer.
            if      ( area2 >  1e-5 ) 
                result= 1;
                return;
            elseif ( area2 < -1e-5 ) 
                result= -1;
                return;
            else
                result= 0;
                return;
            end
        end
        function [char]=InTri2D(Tp0,Tp1,Tp2,pp)
           % compute three AreaSign() values for pp w.r.t. each edge of the face in 2D
           area0 = Triangle.AreaSign( pp, Tp0, Tp1 );
           area1 = Triangle.AreaSign( pp, Tp1, Tp2 );
           area2 = Triangle.AreaSign( pp, Tp2, Tp0 );
           if ( (( area0 == 0 ) && ( area1 > 0 ) && ( area2 > 0 )) || ...
                (( area1 == 0 ) && ( area0 > 0 ) && ( area2 > 0 )) || ...
                (( area2 == 0 ) && ( area0 > 0 ) && ( area1 > 0 )) )
                char= 'E';%在三角形一条边上
                return;
           end
           if ( (( area0 == 0 ) && ( area1 < 0 ) && ( area2 < 0 )) || ...
                (( area1 == 0 ) && ( area0 < 0 ) && ( area2 < 0 )) || ...
                (( area2 == 0 ) && ( area0 < 0 ) && ( area1 < 0 )) )
                char= 'E';%在三角形一条边上
                return;
           end
           if ( (( area0 >  0 ) && ( area1 > 0 ) && ( area2 > 0 )) || ...
                (( area0 <  0 ) && ( area1 < 0 ) && ( area2 < 0 )) )
                char= 'F';%在三角形内部
                return;
           end
           if ( ( area0 == 0 ) && ( area1 == 0 ) && ( area2 == 0 ) )
               error('Error in InTriD');
           end
           if ( (( area0 == 0 ) && ( area1 == 0 )) || ...
                (( area0 == 0 ) && ( area2 == 0 )) || ...
                (( area1 == 0 ) && ( area2 == 0 )) )
                char= 'V';%在某个顶点上
                return;
           else
               char= '0';
               return;
           end
        end
        
    end
end