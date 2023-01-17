O = [0, 0, 0];%[0, -3, 0]
r = 2;
n = [0,0,1];
n=n/norm(n);
u1=[1,0,0];
u1=u1/norm(u1);
radian1=2*pi/3;
drawDiscSector(O,r,n,u1,radian1,'FaceColor','cyan','FaceAlpha',0.5);
d1=O+2*r*u1;
line([0,d1(1)],[0,d1(2)],[0,d1(3)],'LineWidth',1,'color','cyan');
th=-2*pi/3;
qs=[cos(th/2),sin((th/2))*n(1),sin((th/2))*n(2),sin((th/2))*n(3)];
u2=quatrotate(qs,u1);
radian2=3*pi/4;
d2=O+2*r*u2;
line([0,d2(1)],[0,d2(2)],[0,d2(3)],'LineWidth',1,'color','magenta');
drawDiscSector(O,r,n,u2,radian2,'FaceColor','magenta','FaceAlpha',0.5);
line([0,2*r],[0,0],[0,0],'LineWidth',1);
[inter1,inter2,num]=computeIntersectionOfTwoDiscSector(n,u1,radian1,u2,radian2);
if (num==1)
    d=O+2*r*inter1.u;
    line([0,d(1)],[0,d(2)],[0,d(3)],'LineWidth',1,'color','red');
    drawDiscSector(O,r,n,inter1.u,inter1.radian,'FaceColor','red','FaceAlpha',0.1);
elseif (num==2)
    d=O+2*r*inter1.u;
    line([0,d(1)],[0,d(2)],[0,d(3)],'LineWidth',1,'color','green');
    drawDiscSector(O,r,n,inter1.u,inter1.radian,'FaceColor','green','FaceAlpha',0.1);    
    d=O+2*r*inter2.u;
    line([0,d(1)],[0,d(2)],[0,d(3)],'LineWidth',1,'color','blue');
    drawDiscSector(O,r,n,inter2.u,inter2.radian,'FaceColor','blue','FaceAlpha',0.1);    
end
xlabel('x');
ylabel('y');
zlabel('z');
grid off;
hold off;
%axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
axis equal;