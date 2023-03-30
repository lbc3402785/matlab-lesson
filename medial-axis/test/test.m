addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[3,3,1];
c2=[10,6,0];
c3=[-5,5,-2];
c4=[2,-3,1];
c12=c2-c1;
c12=c12/norm(c12);
% c1=[359.156097,171.203094,172.972748];
% c2=[358.990845,171.054413,172.814499];
% 
% c3=[360.994934,174.264099,175.432449];

% r1=5;
r1=1;
r2=3;
r3=2;
r4=2;
figure;
[L1,R1,L2,R2,slabCone12,cv]=drawMedialCone(c1,c2,r1,r2,180,64,'FaceAlpha',0.5);
[b1,t1]=computeBoundBoxForDisc(c1,r1,c12);
[b2,t2]=computeBoundBoxForDisc(c2,r2,c12);
[bottom,top]=BoundingBoxUnion(b1,t1,b2,t2);
draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');
% q1=java.util.HashMap();
% q1.put('u',slab.cv12);
% q1.put('radian',slab.radian12);
% q2=java.util.HashMap();
% q2.put('u',slab1.cv12);
% q2.put('radian',slab1.radian12);
% stricts=java.util.Stack();
% stricts.push(q1);
% stricts.push(q2);
% result=mergeStricts(stricts,c12);
% for i=0:result.size()-1
%     p=result.get(i);
%     u=transpose(p.get('u'));
%     radian=p.get('radian');
%     drawPartMedialCone(c1,c2,r1,r2,slab.V1_UP,slab.V1_DOWN,slab.V2_UP,slab.V2_DOWN,u,c12,radian,m,n,'drawSphere',false,'drawLine',false,'FaceColor','magenta');
%     [bottom,top]=computeBoundBoxForPartCone(slab.slabCone12,u,radian);
%     draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','yellow');
% end
hold on;
axis equal;
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;