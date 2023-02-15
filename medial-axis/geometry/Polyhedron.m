classdef Polyhedron
    properties
        triangles
        bounding_box=Bounds3(Inf(1,3),-Inf(1,3));
    end
    methods
        function obj = Polyhedron(triangles)
            obj.triangles=triangles;
            for i=1:size(triangles,2)
                obj.bounding_box=obj.bounding_box.Union(triangles(i).getBounds());
            end
        end
        function char=InPolyhedron(poly,q)
            radius=norm(poly.bounding_box.Diagonal());
            k=0;
            crossings = 0;
            code = '?';
            if ( ~poly.bounding_box.Inside(q) )
                char='o';
                return;
            end
            while k<size(poly.triangles,2)
                again=false;
                crossings = 0;
                c=poly.triangles(randi(size(poly.triangles,2))).center();
                dir=(c-q);
                dir=dir/norm(dir);
                r=q+radius*dir;
                seg=Segment(q,r);
                for f=1:size(poly.triangles,2)
                    if ~poly.triangles(f).getBounds().IntersectP(seg)
                        code = '0';
                    else
                        [code,p]=poly.triangles(f).SegTri(seg);
                    end
                    if (code == 'p' || code == 'v' || code == 'e') 
                        again=true;
                        break;
                    elseif (code == 'f')
                        crossings=crossings+1;
                    elseif (code == 'V' || code == 'E' || code == 'F')
                        char=code;
                        return;
                    elseif (code == '0')
                    else
                        error('Error');
                    end
                end
                if(again)
                    continue;
                end
                break;
            end
            if( mod(crossings ,2 ) == 1 )
                char='i';
                return;
            else 
                char='o';
                return;
            end
        end
    end
end