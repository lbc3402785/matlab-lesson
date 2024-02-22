addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[-10,0,0];
c2=[10,0,0];
c3=[0,10,0];



r1=6;
r2=8;
r3=2;

[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceAlpha',0.5);
p0=slab.st0.center();
q0=p0+slab.st0.normal;

p1=slab.st1.center();
q1=p1+slab.st1.normal;
line([p0(1),q0(1)],[p0(2),q0(2)],[p0(3),q0(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([p1(1),q1(1)],[p1(2),q1(2)],[p1(3),q1(3)],'LineStyle','-','LineWidth',2,'Color','black');

line([c1(1),slab.V1_UP(1)],[c1(2),slab.V1_UP(2)],[c1(3),slab.V1_UP(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([c1(1),slab.V1_DOWN(1)],[c1(2),slab.V1_DOWN(2)],[c1(3),slab.V1_DOWN(3)],'LineStyle','-','LineWidth',2,'Color','black');

line([c2(1),slab.V2_UP(1)],[c2(2),slab.V2_UP(2)],[c2(3),slab.V2_UP(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([c2(1),slab.V2_DOWN(1)],[c2(2),slab.V2_DOWN(2)],[c2(3),slab.V2_DOWN(3)],'LineStyle','-','LineWidth',2,'Color','black');

line([c3(1),slab.V3_UP(1)],[c3(2),slab.V3_UP(2)],[c3(3),slab.V3_UP(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([c3(1),slab.V3_DOWN(1)],[c3(2),slab.V3_DOWN(2)],[c3(3),slab.V3_DOWN(3)],'LineStyle','-','LineWidth',2,'Color','black');

grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;