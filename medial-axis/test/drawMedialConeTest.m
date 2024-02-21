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
r1=0;
r2=3;
r3=2;
r4=2;
figure;
[L1,R1,L2,R2,slabCone12,cv]=drawMedialCone(c1,c2,r1,r2,180,64,'FaceAlpha',0.5);
hold on;
disp(slabCone12.contains(c1))
disp(slabCone12.contains(c2))
disp(slabCone12.contains(0.5*c1+0.5*c2))
% c21=c1-c2;
% c21=c21/norm(c21);
% 
% radian12=0.5*pi;
% if(abs(r1-r2)>1e-5)
%     radian12=0.5*pi-acos(sqrt(slabCone12.cosThetaSqr));
% end
% if r1>r2
%     radian12=pi-radian12;
% end
% drawSphericalCap(c1,r1,c21,radian12,'FaceColor',[0.88, 0.84, 0.76]);

% radian21=0.5*pi;
% if(abs(r1-r2)>1e-5)
%     radian21=0.5*pi-acos(sqrt(slabCone12.cosThetaSqr));
% end
% if r1<r2
%     radian21=pi-radian21;
% end
% drawSphericalCap(c2,r2,-c21,radian21,'FaceColor',[0.88, 0.84, 0.76]);
% [bottom12,top12]=computeBoundingBoxForSphericalCap(c21,radian12);
% bottom12=bottom12*r1+c1;
% top12=top12*r1+c1;
% draw3DBoundingBox(bottom12(1),bottom12(2),bottom12(3),top12(1),top12(2),top12(3),'color','blue');
% c31=c1-c3;
% c31=c31/norm(c31);
% 
% [L1,R1,L3,R3,slabCone13,cv]=drawMedialCone(c1,c3,r1,r3,180,64,'FaceAlpha',0.5);
% [L1,R1,L4,R4,slabCone14,cv]=drawMedialCone(c1,c4,r1,r4,180,64,'FaceAlpha',0.5);
% radian13=0.5*pi;
% if(abs(r1-r2)>1e-5)
%     radian13=0.5*pi-acos(sqrt(slabCone13.cosThetaSqr));
% end
% if r1>r3
%     radian13=pi-radian13;
% end
% drawSphericalCap(c1,r1,c31,radian13,'FaceColor',[0.88, 0.84, 0.76]);

% [bottom13,top13]=computeBoundingBoxForSphericalCap(c31,radian13);
% bottom13=bottom13*r1+c1;
% top13=top13*r1+c1;
% %draw3DBoundingBox(bottom13(1),bottom13(2),bottom13(3),top13(1),top13(2),top13(3),'color','magenta');
% [bottom,top]=BoundingBoxIntersection(bottom12,top12,bottom13,top13);
% % draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','blue');
% [bottom,top,success,intersect,p1,p2]=computeBoundingBoxForTwoSphericalCap(c1,r1,c21,radian12,c31,radian13);
% if success
%     draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');
%     if intersect
%         text(p1(1),p1(2),p1(3),'p1','HorizontalAlignment','left','FontSize',12);
%         text(p2(1),p2(2),p2(3),'p2','HorizontalAlignment','left','FontSize',12);
%     end
% end
% text(c1(1),c1(2),c1(3),'c1','HorizontalAlignment','left','FontSize',12);
% d0=cv/norm(cv);
% phi=acos(sqrt(1-slabCone.cosThetaSqr));
% line([L2(1),c2(1)],[L2(2),c2(2)],[L2(3),c2(3)],'LineWidth',1);
% line([c1(1),c2(1)],[c1(2),c2(2)],[c1(3),c2(3)],'LineWidth',1);
% [X,Y,Z,pos]=createRadianArc(c2,phi,L2-c2,cross(c2-c1,L2-c2),r2*0.1);
% plot3(X,Y,Z,'Color','red','LineWidth',2);
% text(pos(1),pos(2),pos(3),sprintf('$$\\phi$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',16);
% hold on;
% 
% quiver3(c2(1),c2(2),c2(3),r2*d0(1),r2*d0(2),r2*d0(3),1.0,'LineWidth',1,'MaxHeadSize',0.4);
% top=c2+r2*d0;
% text(top(1),top(2),top(3),sprintf('$$\\overrightarrow{d_{0}}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',16);
% text(c1(1),c1(2),c1(3),'c1','HorizontalAlignment','left','FontSize',12);
% text(c2(1),c2(2),c2(3),'c2','HorizontalAlignment','left','FontSize',12);
% text(L1(1),L1(2),L1(3),'L1','HorizontalAlignment','left','FontSize',12);
% text(R1(1),R1(2),R1(3),'R1','HorizontalAlignment','left','FontSize',12);
% text(L2(1),L2(2),L2(3),'L2','HorizontalAlignment','left','FontSize',12);
% text(R2(1),R2(2),R2(3),'R2','HorizontalAlignment','left','FontSize',12);
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