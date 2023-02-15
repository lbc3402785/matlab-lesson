addpath(genpath('..'));
addpath(genpath('..\geometry'));
O = [0, 0, 0];%[0, -3, 0]
r = 2;
n = [0,0,1];
n=n/norm(n);
stricts=java.util.Stack();

u1=[1,0,0];
u1=u1/norm(u1);
radian1=3*pi/4;
drawDiscSector(O,r,n,u1,radian1,'FaceColor','magenta','FaceAlpha',0.5);
d1=O+2*r*u1;
line([0,d1(1)],[0,d1(2)],[0,d1(3)],'LineWidth',1,'color','magenta');
th=-1*pi/6;
qs=[cos(th/2),sin((th/2))*n(1),sin((th/2))*n(2),sin((th/2))*n(3)];
u2=quatrotate(qs,u1);
radian2=3*pi/4;
d2=O+2*r*u2;
line([0,d2(1)],[0,d2(2)],[0,d2(3)],'LineWidth',1,'color','blue');
drawDiscSector(O,r,n,u2,radian2,'FaceColor','blue','FaceAlpha',0.5);
th=-5*pi/6;
qs=[cos(th/2),sin((th/2))*n(1),sin((th/2))*n(2),sin((th/2))*n(3)];
u3=quatrotate(qs,u1);
radian3=3*pi/4;
d3=O+2*r*u3;
line([0,d3(1)],[0,d3(2)],[0,d3(3)],'LineWidth',1,'color','cyan');
drawDiscSector(O,r,n,u3,radian3,'FaceColor','cyan','FaceAlpha',0.5);

th=-7*pi/6;
qs=[cos(th/2),sin((th/2))*n(1),sin((th/2))*n(2),sin((th/2))*n(3)];
u4=quatrotate(qs,u1);
radian4=3*pi/4;
d4=O+2*r*u4;
line([0,d4(1)],[0,d4(2)],[0,d4(3)],'LineWidth',1,'color','yellow');
drawDiscSector(O,r,n,u4,radian4,'FaceColor','yellow','FaceAlpha',0.5);

th=-8*pi/6;
qs=[cos(th/2),sin((th/2))*n(1),sin((th/2))*n(2),sin((th/2))*n(3)];
u5=quatrotate(qs,u1);
radian5=3*pi/4;
d5=O+2*r*u5;
line([0,d5(1)],[0,d5(2)],[0,d5(3)],'LineWidth',1,'color','green');
drawDiscSector(O,r,n,u5,radian5,'FaceColor','green','FaceAlpha',0.5);

line([0,2*r],[0,0],[0,0],'LineWidth',1);

q1=java.util.HashMap();
q1.put('u',u1);
q1.put('radian',radian1);
stricts.push(q1);
q2=java.util.HashMap();
q2.put('u',u2);
q2.put('radian',radian2);
stricts.push(q2);
q3=java.util.HashMap();
q3.put('u',u3);
q3.put('radian',radian3);
stricts.push(q3);
q4=java.util.HashMap();
q4.put('u',u4);
q4.put('radian',radian4);
stricts.push(q4);
q5=java.util.HashMap();
q5.put('u',u5);
q5.put('radian',radian5);
stricts.push(q5);
result=mergeStricts(stricts,n);
for i=0:result.size()-1
    p=result.get(i);
    u=transpose(p.get('u'));
    radian=p.get('radian');
    drawDiscSector(O,r,n,u,radian,'FaceColor','red','FaceAlpha',0.5);
    d=O+2*r*u;
    line([0,d(1)],[0,d(2)],[0,d(3)],'LineWidth',1,'color','red');
end