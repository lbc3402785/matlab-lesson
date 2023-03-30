addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[1,3,0];
c2=[1,-3,0];
c3=[4,0,0];
c4=[-0.5,0,1.5*1.73];
c5=[-0.5,0,-1.5*1.73];


r1=1;
r2=1;
r3=0.5;
r4=0.5;
r5=0.5;

drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceAlpha',1);
hold on;
drawMedialSlab(c1,c2,c4,r1,r2,r4,180,64,true,true,true,'FaceAlpha',1);
hold on;
drawMedialSlab(c1,c2,c5,r1,r2,r5,180,64,true,true,true,'FaceAlpha',1);
hold on;

grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;