center=[0,0,0];
radius=1;
v=[0,0,1];
u1=[1,0,0];
radian1=2*pi/3;
th=-2*pi/3;
qs=[cos(th/2),sin((th/2))*v(1),sin((th/2))*v(2),sin((th/2))*v(3)];
u2=quatrotate(qs,u1);
radian2=2*pi/3;
u3=quatrotate(qs,u2);
radian3=2*pi/3;
figure;
drawSphericalCap(center,radius,u1,radian1,'FaceColor','blue');
hold on;
drawSphericalCap(center,radius,u2,radian2,'FaceColor','magenta');
hold on;
drawSphericalCap(center,radius,u3,radian3,'FaceColor','yellow');
hold on;
us=java.util.ArrayList();
us.add(u1);
us.add(u2);
us.add(u3);
radians=java.util.ArrayList();
radians.add(radian1);
radians.add(radian2);
radians.add(radian3);
axis equal;
[bottom,top,success,intersect,ps]=computeBoundingBoxForAnySphericalCap(center,radius,us,radians);
if success
    draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');
    if intersect
        for i=0:ps.size()-1
            vi=ps.get(i);
            text(vi(1),vi(2),vi(3),sprintf('$$V_{%i}$$',i),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',20,'Color','red');
        end
    end
end

grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
axis equal;