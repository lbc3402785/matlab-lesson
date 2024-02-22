addpath(genpath('..'));
addpath(genpath('..\geometry'));
c0=[1,3,2];
c1=[1,-3,0];
c2=[4,0,0];
r0=3;
r1=1;
r2=2;
% [slabCone]=computeSlabCone(c0,r0,c1,r1);
text(c0(1),c0(2),c0(3),sprintf('$$c_0$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
text(c1(1),c1(2),c1(3),sprintf('$$c_1$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
hold on;
[L1,R1,L2,R2,slabCone,cv]=drawMedialCone(c0,r0,c1,r1,180,64,'FaceAlpha',0.5);
drawMedialCone(c0,r0,c2,r2,180,64,'FaceAlpha',0.5);
drawMedialCone(c1,r1,c2,r2,180,64,'FaceAlpha',0.5);
hold on;
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;