addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[3,6,1];
c2=[6,-5,0];
c3=[-5,5,-2];
r1=4;
r2=3;
r3=2;
[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,'drawSphere',false);
origin=slab.st0.v0*0.12+slab.st0.v1*0.55+slab.st0.v2*0.33;
v=origin+slab.st0.normal;
tri=Triangle(c1,c2,c3);
tri1=Triangle(slab.st0.v0,slab.st0.v1,slab.st0.v2);
ray=Ray(origin,-slab.st0.normal);
[inter]=tri.getIntersectionOfRay(ray,'ignoreDirection',true);
% tri.draw();
% hold on;
% tri1.draw();
if inter.happened
    disp('--------------')
    x1=origin(1);
    y1=origin(2);
    z1=origin(3);
    x2=inter.coords(1);
    y2=inter.coords(2);
    z2=inter.coords(3);
    line([x1,x2],[y1,y1],[z1,z2],'LineStyle','--','LineWidth',1,'Color','red');
    [bary]=tri.getBarycentrics(inter.coords);
%     disp(inter.coords);
%     disp(c1*bary(1)+c2*bary(2)+c3*bary(3));
%     disp(norm(inter.coords-origin));
    disp(r1*bary(1)+r2*bary(2)+r3*bary(3));
    sphere=Sphere(c1*bary(1)+c2*bary(2)+c3*bary(3),r1*bary(1)+r2*bary(2)+r3*bary(3));
    [fp,dist]=sphere.project(v);
    disp(origin);
    disp(fp);
end
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;