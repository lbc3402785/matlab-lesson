center=[1,0,3];
radius=1;
u=[1,-2,1];
u=u/norm(u);
drawSpherialSector(center,radius,u,pi/6);
[bottom,top]=computeBoundingBoxForSpherialSector(u,pi/6);
bottom=bottom*radius+center;
top=top*radius+center;
draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','blue');
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
axis equal;