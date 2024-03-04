addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[2,3,0];
c2=[1,-1,0];
c3=[4,0,0];



r1=1;
r2=2;
r3=0.5;


[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceAlpha',1);
hold on;
bd=slab.getBounds();
bottom=bd.pMin;
top=bd.pMax;
draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;