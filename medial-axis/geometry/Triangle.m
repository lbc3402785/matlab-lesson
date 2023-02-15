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
        function [bd]=getBounds(tri)
            bottom=tri.v1;
            top=tri.v1;
            bottom=[min(bottom(1),tri.v2(1)),min(bottom(2),tri.v2(2)),min(bottom(3),tri.v2(3))];
            bottom=[min(bottom(1),tri.v3(1)),min(bottom(2),tri.v3(2)),min(bottom(3),tri.v3(3))];
            
            top=[max(top(1),tri.v2(1)),max(top(2),tri.v2(2)),max(top(3),tri.v2(3))];
            top=[max(top(1),tri.v3(1)),max(top(2),tri.v3(2)),max(top(3),tri.v3(3))];
            bd=Bounds3(bottom,top);
        end
        function [inter]=getIntersectionOfRay(tri,ray)
            inter.happened = false;
            if (dot(ray.direction, tri.normal) > 0)
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