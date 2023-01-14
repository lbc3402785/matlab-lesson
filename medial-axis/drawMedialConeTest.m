c1=[3,6,0];
c2=[10,6,0];
%c3=[8,4,8];
r1=1;
r2=3;
%r3=2;
[L1,R1,L2,R2,slabCone,cv]=drawMedialCone(c1,c2,r1,r2,180,64,'FaceAlpha',0.5);

d0=cv/norm(cv);
phi=acos(sqrt(1-slabCone.cosThetaSqr));
line([L2(1),c2(1)],[L2(2),c2(2)],[L2(3),c2(3)],'LineWidth',1);
line([c1(1),c2(1)],[c1(2),c2(2)],[c1(3),c2(3)],'LineWidth',1);
[X,Y,Z,pos]=createRadianArc(c2,phi,L2-c2,cross(c2-c1,L2-c2),r2*0.1);
plot3(X,Y,Z,'Color','red','LineWidth',2);
text(pos(1),pos(2),pos(3),sprintf('$$\\phi$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',16);
hold on;

quiver3(c2(1),c2(2),c2(3),r2*d0(1),r2*d0(2),r2*d0(3),1.0,'LineWidth',1,'MaxHeadSize',0.4);
top=c2+r2*d0;
text(top(1),top(2),top(3),sprintf('$$\\overrightarrow{d_{0}}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',16);
text(c1(1),c1(2),c1(3),'c1','HorizontalAlignment','left','FontSize',12);
text(c2(1),c2(2),c2(3),'c2','HorizontalAlignment','left','FontSize',12);
text(L1(1),L1(2),L1(3),'L1','HorizontalAlignment','left','FontSize',12);
text(R1(1),R1(2),R1(3),'R1','HorizontalAlignment','left','FontSize',12);
text(L2(1),L2(2),L2(3),'L2','HorizontalAlignment','left','FontSize',12);
text(R2(1),R2(2),R2(3),'R2','HorizontalAlignment','left','FontSize',12);
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