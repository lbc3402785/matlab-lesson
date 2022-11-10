c1=[0,0,0];
c2=[8,0,0];
r1=2;
r2=3;
[L1,R1,L2,R2,d0,cos_phi,sin_phi]=drawMedialCone(c1,c2,r1,r2,180,64,'drawCircle',true,'drawLine',true,'drawCone',false,'FaceAlpha',0.5);
c=[5,1,0];
r=2.5;
LR=R1-L1;
c1c2=c2-c1;
v=cross(c1c2,LR);
v=v/norm(v);
u=cross(v,c1c2);
u=u/norm(u);
drawCircle(c,u,v,r);
line([c1(1),c(1)],[c1(2),c(2)],[c1(3),c(3)],'LineWidth',1);
u1=L1-c1;
u1=u1/norm(u1);
u2=R1-c1;
u2=u2/norm(u2);
text(c(1),c(2),c(3),'c','HorizontalAlignment','left','FontSize',12);
text(c1(1),c1(2),c1(3),'c1','HorizontalAlignment','left','FontSize',12);
text(c2(1),c2(2),c2(3),'c2','HorizontalAlignment','left','FontSize',12);
length=dot(c-c1,u1);
p=c1+length*u1;
line([p(1),c(1)],[p(2),c(2)],[p(3),c(3)],'LineStyle','--','LineWidth',1);
L=c+r*u1;
line([L(1),c(1)],[L(2),c(2)],[L(3),c(3)],'LineStyle','--','LineWidth',1);
length=dot(c-c1,u2);
p=c-length*u2;
line([p(1),c1(1)],[p(2),c1(2)],[p(3),c1(3)],'LineStyle','--','LineWidth',1);
R=c+(r1-length)*u2;
line([R(1),c(1)],[R(2),c(2)],[R(3),c(3)],'LineStyle','--','LineWidth',1);
grid off;
hold off;
axis off;