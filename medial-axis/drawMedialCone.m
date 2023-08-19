function [L1,R1,L2,R2,slabCone,cv]=drawMedialCone(c1,c2,r1,r2,m,n,varargin)

if(~exist('m','var'))
    m = 180;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('n','var'))
    n = 64;  % 如果未出现该变量，则对其进行赋值
end
p = inputParser;            % 函数的输入解析器
addParameter(p,'mode','face');      % 设置变量名和默认参数
addParameter(p,'drawCone',true);      % 设置变量名和默认参数
addParameter(p,'drawLine',false);      % 设置变量名和默认参数
addParameter(p,'drawCircle',false);      % 设置变量名和默认参数
addParameter(p,'FaceAlpha',1);      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值

[slabCone]=computeSlabCone(c1,r1,c2,r2);

cv=[1,0,0];
if (abs(slabCone.axis(1))>abs(slabCone.axis(2)))
    cv=[-slabCone.axis(3),0,slabCone.axis(1)];
else
    cv=[0,slabCone.axis(3),-slabCone.axis(2)];
end
cv=cv/norm(cv);
if(r1==0&&r2==0)
    L1=c1;
    R1=c1;
    L2=c2;
    R2=c2;
    return;
end

if(r1<r2)
    L1 = slabCone.smallCenter+slabCone.base*cv; 
    L2 = slabCone.bigCenter+slabCone.top*cv; % 左线切点
    R1 = slabCone.smallCenter-slabCone.base*cv; 
    R2 = slabCone.bigCenter-slabCone.top*cv; % 右线切点
else
    L2 = slabCone.smallCenter+slabCone.base*cv; 
    L1 = slabCone.bigCenter+slabCone.top*cv; % 左线切点
    R2 = slabCone.smallCenter-slabCone.base*cv; 
    R1 = slabCone.bigCenter-slabCone.top*cv; % 右线切点
end
c21=c1-c2;
c21=c21/norm(c21);
u1=c21;
c1L1=L1-c1;
c1L1=c1L1/norm(c1L1);
radian1=acos(dot(c1L1,u1));
radian1=0.5*pi-acos(sqrt(slabCone.cosThetaSqr));
if r1>r2
    radian1=pi-radian1;
end

[x1,y1,z1] = sphere(128);
x1=x1*r1+c1(1);
y1=y1*r1+c1(2);
z1=z1*r1+c1(3);
h1 = surf(x1, y1, z1);
set(h1,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor','none');%phong
% drawSphericalCap(c1,r1,u1,radian1,'FaceColor',[0.88, 0.84, 0.76]);

hold on;
u2=-c21;
c2L2=L2-c2;
c2L2=c2L2/norm(c2L2);
radian2=acos(dot(c2L2,u2));
radian2=0.5*pi-acos(sqrt(slabCone.cosThetaSqr));
if r1<r2
    radian2=pi-radian2;
end
[x2,y2,z2] = sphere(128);
x2=x2*r2+c2(1);
y2=y2*r2+c2(2);
z2=z2*r2+c2(3);
h2 = surf(x2, y2, z2);
set(h2,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor','none')
% drawSphericalCap(c2,r2,u2,radian2,'FaceColor',[0.88, 0.84, 0.76]);


daspect([1 1 1]);

if p.Results.drawCircle
    drawCircle(c1,u1,cv,r1);
    drawCircle(c2,u2,cv,r2);
end
if p.Results.drawLine
    line([c1(1),c2(1)],[c1(2),c2(2)],[c1(3),c2(3)],'LineWidth',2,'Color','magenta');
    line([c1(1),L1(1)],[c1(2),L1(2)],[c1(3),L1(3)],'LineWidth',1);
    line([c1(1),R1(1)],[c1(2),R1(2)],[c1(3),R1(3)],'LineWidth',1);
    line([c2(1),L2(1)],[c2(2),L2(2)],[c2(3),L2(3)],'LineWidth',1);
    line([c2(1),R2(1)],[c2(2),R2(2)],[c2(3),R2(3)],'LineWidth',1);
end


v1=(L1-R1)*0.5;
v1=v1/norm(v1);
v2=(L2-R2)*0.5;
v2=v2/norm(v2);
if p.Results.drawCircle
    [X1,Y1,Z1]=drawCircle(slabCone.smallCenter,cv,slabCone.axis,slabCone.base,180,'Color','cyan');
    [X2,Y2,Z2]=drawCircle(slabCone.bigCenter,cv,slabCone.axis,slabCone.top,180,'Color','cyan');
end
if p.Results.drawCone
    [X1,Y1,Z1]=createCircle(slabCone.smallCenter,cv,slabCone.axis,slabCone.base,m);
    [X2,Y2,Z2]=createCircle(slabCone.bigCenter,cv,slabCone.axis,slabCone.top,m);
    drawCone(X1,Y1,Z1,X2,Y2,Z2,'mode',p.Results.mode,'FaceAlpha',p.Results.FaceAlpha);
end
if p.Results.drawLine
    line([L1(1),L2(1)],[L1(2),L2(2)],[L1(3),L2(3)],'LineWidth',2,'Color','m');
    line([R1(1),R2(1)],[R1(2),R2(2)],[R1(3),R2(3)],'LineWidth',2,'Color','m');
end
end