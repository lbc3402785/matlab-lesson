% O = [-1, 1, 10];
% r = 1.5;
% n = [3, -2, 1];
% n=n/norm(n);
% u=[1,2,1];
% u=u/norm(u);
% radian=2.7*pi/3;
O = [1, 0, 0];%[0, -3, 0]
r = 2;
n = [0, 0,-2];
n=n/norm(n);
u=[1,2,0];
u=u/norm(u);
radian=1*pi/3;
% xlabel('x');
% ylabel('y');
% zlabel('z');
% drawDiscSector(O,r,n,u,radian,'FaceAlpha','0.5','FaceColor','magenta');
% hold on;
axis equal;
drawDiskSegment(O,r,n,u,radian,'FaceAlpha','0.5');
% [bottom,top]=computeBoundBoxForDiscSector(O,r,n,u,radian);
% draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','blue');
[bottom,top,keys]=computeBoundBoxForDiscSegment(O,r,n,u,radian);
draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');
for i=0:keys.size()-1
    vi=keys.get(i);
    text(vi(1),vi(2),vi(3),sprintf('$$V_{%i}$$',i),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',20,'Color','red');
end
grid off;
hold off;
axis off;

light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
axis equal;