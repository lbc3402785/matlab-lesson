addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[1,3,0];
c2=[1,-3,0];
c3=[-5,-3,0];
c4=[-5,-2,6];
c5=[8,-2,3];

center=(c1+c2+c3)/3;

r1=3;
r2=2.5;
r3=1;
r4=3;
r5=5;

c12=c2-c1;
c13=c3-c1;
fn=cross(c12,c13);
fn=fn/norm(fn);

[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,false,false,true,'FaceColor','red','drawSphere',false);

hold on;

grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;