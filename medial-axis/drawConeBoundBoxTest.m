addpath(genpath('..\'));
addpath(genpath('..\geometry'));
% c2=[2,4,0];
% c3=[-5,2,3];
c1=[3,3,1];
c2=[10,6,0];
c3=[-5,5,-2];
c4=[2,-3,1];
% c1=[359.156097,171.203094,172.972748];
% c2=[358.990845,171.054413,172.814499];
% 
% c3=[360.994934,174.264099,175.432449];

% r1=5;
r1=5;
r2=3;
r3=2;
r4=2;
figure;
[L1,R1,L2,R2,slabCone12,cv]=drawMedialCone(c1,r1,c2,r2,180,64,'FaceAlpha',0.5);
hold on;
bd=slabCone12.getBounds();
bottom=bd.pMin;
top=bd.pMax;
draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');

grid off;
hold off;
axis off;
% ka= 0.7;
% kd= 0.84;
% ks= 0.4;
% shine=120;
% material([ka kd ks shine]);
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
%light('Color',[0.8, 0.8, 0.8],'Position',[-10 10 -10],'Style','infinite');
%light('Color',[0.8, 0.8, 0.8],'Position',[0 0 -10],'Style','infinite');

camlight;