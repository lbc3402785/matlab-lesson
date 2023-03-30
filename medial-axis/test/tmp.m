addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[4,3,0];
c2=[4,-3,0];
c3=[0,0,0];
c4=[-5,-2,6];
c5=[8,-2,3];

center=(c1+c2+c3)/3;

r1=0;
r2=0;
r3=3.8;
% r3=0;
r4=3;
r5=5;

c12=c2-c1;
c13=c3-c1;
fn=cross(c12,c13);
fn=fn/norm(fn);

[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceColor','blue','drawSphere',true);
line([slab.V1_UP(1),slab.V1_DOWN(1)],[slab.V1_UP(2),slab.V1_DOWN(2)],[slab.V1_UP(3),slab.V1_DOWN(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([slab.V2_UP(1),slab.V2_DOWN(1)],[slab.V2_UP(2),slab.V2_DOWN(2)],[slab.V2_UP(3),slab.V2_DOWN(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([slab.V3_UP(1),slab.V3_DOWN(1)],[slab.V3_UP(2),slab.V3_DOWN(2)],[slab.V3_UP(3),slab.V3_DOWN(3)],'LineStyle','-','LineWidth',1,'Color','black');
hold on;

grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;