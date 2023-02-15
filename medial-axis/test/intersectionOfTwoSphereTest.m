addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[155.639786,91.7727127,87.7780457];
r1=11.0073309;
c2=[179.659088,97.6806870,101.230698];
r2=23.3767948;
[u1,radian1,u2,radian2,isIntersect]=intersectionOfTwoSphere(c1,r1,c2,r2);
if isIntersect
    drawSphericalCap(c1,r1,u1,radian1,'FaceColor','blue');
    hold on;
    [bottom1,top1]=computeBoundingBoxForSphericalCap(u1,radian1);
    bottom1=bottom1*r1+c1;
    top1=top1*r1+c1;
    draw3DBoundingBox(bottom1(1),bottom1(2),bottom1(3),top1(1),top1(2),top1(3),'color','red');
    hold on;
    drawSphericalCap(c2,r2,u2,radian2,'FaceColor','magenta');
    hold on;
    [bottom2,top2]=computeBoundingBoxForSphericalCap(u2,radian2);
    bottom2=bottom2*r2+c2;
    top2=top2*r2+c2;
    draw3DBoundingBox(bottom2(1),bottom2(2),bottom2(3),top2(1),top2(2),top2(3),'color','blue');
end
axis equal;
grid off;
hold off;
% axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;