addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[-3,0,2];
c2=[6,0,0];
c3=[0,3,3];



r1=3;
r2=1;
r3=2;
line([c1(1),c2(1)],[c1(2),c2(2)],[c1(3),c2(3)],'LineStyle','-','LineWidth',2,'Color','red');
line([c1(1),c3(1)],[c1(2),c3(2)],[c1(3),c3(3)],'LineStyle','-','LineWidth',2,'Color','red');
line([c2(1),c3(1)],[c2(2),c3(2)],[c2(3),c3(3)],'LineStyle','-','LineWidth',2,'Color','red');
hold on;
% [slab,success]=computeMedialSlab(c1,c2,c3,r1,r2,r3);
[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceAlpha',0.5);
line([c1(1),slab.V1_UP(1)],[c1(2),slab.V1_UP(2)],[c1(3),slab.V1_UP(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([c1(1),slab.V1_DOWN(1)],[c1(2),slab.V1_DOWN(2)],[c1(3),slab.V1_DOWN(3)],'LineStyle','-','LineWidth',1,'Color','black');

line([c2(1),slab.V2_UP(1)],[c2(2),slab.V2_UP(2)],[c2(3),slab.V2_UP(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([c2(1),slab.V2_DOWN(1)],[c2(2),slab.V2_DOWN(2)],[c2(3),slab.V2_DOWN(3)],'LineStyle','-','LineWidth',1,'Color','black');

line([c3(1),slab.V3_UP(1)],[c3(2),slab.V3_UP(2)],[c3(3),slab.V3_UP(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([c3(1),slab.V3_DOWN(1)],[c3(2),slab.V3_DOWN(2)],[c3(3),slab.V3_DOWN(3)],'LineStyle','-','LineWidth',1,'Color','black');



line([slab.V1_UP(1),slab.V2_UP(1)],[slab.V1_UP(2),slab.V2_UP(2)],[slab.V1_UP(3),slab.V2_UP(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([slab.V1_UP(1),slab.V3_UP(1)],[slab.V1_UP(2),slab.V3_UP(2)],[slab.V1_UP(3),slab.V3_UP(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([slab.V2_UP(1),slab.V3_UP(1)],[slab.V2_UP(2),slab.V3_UP(2)],[slab.V2_UP(3),slab.V3_UP(3)],'LineStyle','-','LineWidth',2,'Color','black');

line([slab.V1_DOWN(1),slab.V2_DOWN(1)],[slab.V1_DOWN(2),slab.V2_DOWN(2)],[slab.V1_DOWN(3),slab.V2_DOWN(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([slab.V1_DOWN(1),slab.V3_DOWN(1)],[slab.V1_DOWN(2),slab.V3_DOWN(2)],[slab.V1_DOWN(3),slab.V3_DOWN(3)],'LineStyle','-','LineWidth',2,'Color','black');
line([slab.V2_DOWN(1),slab.V3_DOWN(1)],[slab.V2_DOWN(2),slab.V3_DOWN(2)],[slab.V2_DOWN(3),slab.V3_DOWN(3)],'LineStyle','-','LineWidth',2,'Color','black');

c=slab.tri.center();
q=c+slab.tri.normal;
line([c(1),q(1)],[c(2),q(2)],[c(3),q(3)],'LineStyle','-','LineWidth',2,'Color','black');
% p=[2,0.5,0];
% p=(slab.V1_DOWN+c1)*0.5;
% p=slab.V1_DOWN;
% p=(slab.V1_DOWN+slab.V2_DOWN)*0.5;
% p=(slab.V1_DOWN+slab.V2_DOWN+c1+c2)*0.25;
% n12=cross(slab.n1,c2-c1);
% p=p+1e-6*n12;
% p=(slab.V1_DOWN+slab.V2_DOWN+slab.V3_DOWN)/3+1e-6*slab.n1;
% p=c1;
% p=(c1+c2+c3)/3.0-1e-3*slab.tri.normal;
p=slab.V1_UP;
plot3(p(1), p(2), p(3), 'o', 'MarkerSize', 10, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'r');
[success]=slab.InBottomPentahedron(p);
if success
    disp('point In Bottom Pentahedron!');
end
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;