function [L1,R1,L2,R2,d0,cos_phi,sin_phi]=drawMedialCone(c1,c2,r1,r2,m,n,varargin)
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
addParameter(p,'FaceAlpha',0.5);      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值

[cu,cv,d0,u1,u2,L1,R1,L2,R2,cos_phi,sin_phi]=commonTangent(c1,c2,r1,r2);

[x1,y1,z1] = sphere(128);
x1=x1*r1+c1(1);
y1=y1*r1+c1(2);
z1=z1*r1+c1(3);
h1 = surf(x1, y1, z1);
set(h1,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor','none');%phong
% set(h1,'FaceColor',[0.807 0.6390 0.6156],'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')

hold on;
[x2,y2,z2] = sphere(128);
x2=x2*r2+c2(1);
y2=y2*r2+c2(2);
z2=z2*r2+c2(3);
h2 = surf(x2, y2, z2);
set(h2,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor','none')
%set(h2,'FaceColor',[0.807 0.6390 0.6156],'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')
%set(h2, 'FaceColor', [1 0 0])
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
srl=norm(L1-R1)*0.5;
srr=norm(L2-R2)*0.5;

v1=(L1-R1)*0.5;
v1=v1/norm(v1);
v2=(L2-R2)*0.5;
v2=v2/norm(v2);
if p.Results.drawCircle
    [X1,Y1,Z1]=drawCircle((L1+R1)*0.5,v1,cu,srl,180,'Color','cyan');
    [X2,Y2,Z2]=drawCircle((L2+R2)*0.5,v2,cu,srr,180,'Color','cyan');
end
if p.Results.drawCone
    if p.Results.drawCircle==false
        [X1,Y1,Z1]=createCircle((L1+R1)*0.5,v1,cu,srl,m);
        [X2,Y2,Z2]=createCircle((L2+R2)*0.5,v2,cu,srr,m);
    end
    drawCone(X1,Y1,Z1,X2,Y2,Z2,n,'mode',p.Results.mode,'FaceAlpha',p.Results.FaceAlpha);
end
if p.Results.drawLine
    line([L1(1),L2(1)],[L1(2),L2(2)],[L1(3),L2(3)],'LineWidth',2,'Color','m');
    line([R1(1),R2(1)],[R1(2),R2(2)],[R1(3),R2(3)],'LineWidth',2,'Color','m');
end
end