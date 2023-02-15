addpath(genpath('..\'));
addpath(genpath('..\geometry'));
center=[0,0,0];
radius=1;
% u1=[-1,-1,-2];
u1=[-1,-2,2];
u1=u1/norm(u1);
radian1=pi/3;
% figure;
drawSphericalCap(center,radius,u1,radian1,'FaceColor','blue');
hold on;
u2=[1,-2,1];
% u2=[-1,-1,-2.5];
u2=u2/norm(u2);
radian2=pi/3;
drawSphericalCap(center,radius,u2,radian2,'FaceColor','red');

u3=[1,-1,3];
% u2=[-1,-1,-2.5];
u3=u3/norm(u3);
radian3=pi/3;
drawSphericalCap(center,radius,u3,radian3,'FaceColor','yellow');
hold on;
u4=[3,-2,-2];
u4=u4/norm(u4);
radian4=pi/3;
drawSphericalCap(center,radius,u4,radian4,'FaceColor','green');
hold on;

us=java.util.ArrayList();
us.add(u1);
us.add(u2);
us.add(u3);
us.add(u4);
radians=java.util.ArrayList();
radians.add(radian1);
radians.add(radian2);
radians.add(radian3);
radians.add(radian4);
axis equal;
[bottom,top,success,intersect,ps]=computeBoundingBoxForAnySphericalCap(center,radius,us,radians);
if success
    draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');
    if intersect
        for i=0:ps.size()-1
            vi=ps.get(i);
            text(vi(1),vi(2),vi(3),sprintf('$$V_{%i}$$',i),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
        end
    end
end
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
axis equal;