classdef Sphere
    properties
        center
        radius
        radius2
    end
    methods
        function sphere = Sphere(c,r)
            sphere.center=c;
            sphere.radius=r;
            sphere.radius2=r*r;
        end
        function draw(s)
            [x,y,z] = sphere(128);
            x=x*s.radius+s.center(1);
            y=y*s.radius+s.center(2);
            z=z*s.radius+s.center(3);
            h1 = surf(x, y, z);
            set(h1,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',0.1,'FaceLighting','gouraud','EdgeColor','none');%phong
        end
        function [fp,signeddist]=project(sphere,p)
            ncp=(p-sphere.center);
            if(norm(ncp)<1e-12)
                fp=sphere.center;
                signeddist=-sphere.radius;
                return;
            end
            ncp_sl =norm(ncp)*norm(ncp);
            interior=ncp_sl < sphere.radius2;
            ncp=ncp/norm(ncp);
            fp = sphere.center + sphere.radius * ncp;
            if (interior)
                signeddist=-norm(p-fp);
            else
                signeddist=norm(p-fp);
            end
        end
    end
end