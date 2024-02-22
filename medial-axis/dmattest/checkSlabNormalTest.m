addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[3,3,7];
c2=[13,-3,2];
c3=[-2,2,-4];



r1=3;
r2=2;
r3=5;

[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceAlpha',0.5);
p0=slab.st0.center();
q0=p0+slab.st0.normal;

p1=slab.st1.center();
q1=p1+slab.st1.normal;
line([p0(1),q0(1)],[p0(2),q0(2)],[p0(3),q0(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([p1(1),q1(1)],[p1(2),q1(2)],[p1(3),q1(3)],'LineStyle','-','LineWidth',2,'Color','black');
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;