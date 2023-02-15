c1=[1,3,0];
c2=[1,-3,0];
c3=[-5,1,-6];
c4=[-5,-2,6];
c5=[5,1,3];

center=(c1+c2+c3)/3;

r1=2;
r2=2.5;
r3=2;
r4=3;
r5=3;

c12=c2-c1;
c13=c3-c1;
fn=cross(c12,c13);
fn=fn/norm(fn);


% [V1_UP,V1_DOWN,O1,A1,B1,V2_UP,V2_DOWN,O2,A2,B2,V3_UP,V3_DOWN,O3,A3,B3]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,false,false,false);
[V1_UP,V1_DOWN,V2_UP,V2_DOWN,V3_UP,V3_DOWN]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceColor','red','drawSphere',false);
text(V1_UP(1)-fn(1)*0.1,V1_UP(2)-fn(2)*0.1,V1_UP(3)-fn(3)*0.1,sprintf('$$V_{1}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V1_DOWN(1)+fn(1)*0.1,V1_DOWN(2)+fn(2)*0.1,V1_DOWN(3)+fn(3)*0.1,sprintf('$$V_{1}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V2_UP(1)-fn(1)*0.1,V2_UP(2)-fn(2)*0.1,V2_UP(3)-fn(3)*0.1,sprintf('$$V_{2}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V2_DOWN(1)+fn(1)*0.1,V2_DOWN(2)+fn(2)*0.1,V2_DOWN(3)+fn(3)*0.1,sprintf('$$V_{2}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V3_UP(1)-fn(1)*0.1,V3_UP(2)-fn(2)*0.1,V3_UP(3)-fn(3)*0.1,sprintf('$$V_{3}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V3_DOWN(1)+fn(1)*0.1,V3_DOWN(2)+fn(2)*0.1,V3_DOWN(3)+fn(3)*0.1,sprintf('$$V_{3}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');

tri=Triangle(V1_UP,V2_UP,V3_UP);


[V1_UP,V1_DOWN,V2_UP,V2_DOWN,V4_UP,V4_DOWN]=drawMedialSlab(c1,c2,c4,r1,r2,r4,180,64,false,false,false,'FaceColor','blue','drawSphere',false);
v14=V4_UP-V1_UP;
v12=V2_UP-V1_UP;
fn=cross(v14,v12);
fn=fn/norm(fn);
text(V1_UP(1)-fn(1)*0.1,V1_UP(2)-fn(2)*0.1,V1_UP(3)-fn(3)*0.1,sprintf('$$V_{1}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V1_DOWN(1)+fn(1)*0.1,V1_DOWN(2)+fn(2)*0.1,V1_DOWN(3)+fn(3)*0.1,sprintf('$$V_{1}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V2_UP(1)-fn(1)*0.1,V2_UP(2)-fn(2)*0.1,V2_UP(3)-fn(3)*0.1,sprintf('$$V_{2}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V2_DOWN(1)+fn(1)*0.1,V2_DOWN(2)+fn(2)*0.1,V2_DOWN(3)+fn(3)*0.1,sprintf('$$V_{2}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V4_UP(1)-fn(1)*0.1,V4_UP(2)-fn(2)*0.1,V4_UP(3)-fn(3)*0.1,sprintf('$$V_{4}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
text(V4_DOWN(1)+fn(1)*0.1,V4_DOWN(2)+fn(2)*0.1,V4_DOWN(3)+fn(3)*0.1,sprintf('$$V_{4}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');

planeD=-dot(V4_UP,fn);
plane=Plane(fn,planeD);
[outSegTips]=trianglePlaneIntersection(plane,tri);

hold on;
if(outSegTips.size()==2)
    p1=outSegTips.get(0);
    p2=outSegTips.get(1);
    fn=cross(c12,c13);
    fn=fn/norm(fn);
    text(p1(1)-fn(1)*0.1,p1(2)-fn(2)*0.1,p1(3)-fn(3)*0.1,sprintf('$$p_{1}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
    text(p2(1)-fn(1)*0.1,p2(2)-fn(2)*0.1,p2(3)-fn(3)*0.1,sprintf('$$p_{2}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
    line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)],'LineStyle','--','LineWidth',1,'Color','black');
    [bottom,top]=computeBoundingBoxForTriangle(p1,p2,V3_UP);
    draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','blue');
end
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
