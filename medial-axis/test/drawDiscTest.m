O = [0, 1, 2];
r = 2;
n = [1, 1, 0];
n=n/norm(n);
drawDisc(O,r,n);
hold on;
[bottom,top]=computeBoundBoxForDisc(O,r,n);
draw3DBoundingBox(bottom(1),bottom(2),bottom(3),top(1),top(2),top(3),'color','red');
axis equal;
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
