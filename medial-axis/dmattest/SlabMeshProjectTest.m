addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[-3,0,2];
c2=[6,0,0];
c3=[0,3,3];
c4=[0,-2,0];


r1=3;
r2=1;
r3=2;
r4=2;
% [slab,success]=computeMedialSlab(c1,c2,c3,r1,r2,r3);
[slab1,success1]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceAlpha',0.5);
% hold off;
[slab2,success2]=drawMedialSlab(c1,c2,c4,r1,r2,r4,180,64,true,true,true,'FaceAlpha',0.5);
% p=[2,0.5,0];
p=[2,0.5,3];

[u1,v1,w1,fp1,signeddist1]=slab1.project(p);
[u2,v2,w2,fp2,signeddist2]=slab2.project(p);
fp=[];
if signeddist1<signeddist2
    fp=fp1;
else
    fp=fp2;
end
text(p(1),p(2),p(3),sprintf('$$p$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(fp(1),fp(2),fp(3),sprintf('$$fp$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
line([fp(1),p(1)],[fp(2),p(2)],[fp(3),p(3)],'LineStyle','-','LineWidth',2,'Color','red');
% plot3(p(1), p(2), p(3), 'o', 'MarkerSize', 10, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'r');
% plot3(fp(1), fp(2), fp(3), 'o', 'MarkerSize', 10, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'r');
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;