function [smallCircleCenter,base,bigCircleCenter,top1]=drawPartMedialCone(c1,c2,r1,r2,L1,R1,L2,R2,cv,axis,radian,m,n,varargin)
%函数的功能：
%函数的描述：
%函数的使用：y=func(input1,input2)
%输入：
%     cv:旋转向量
%     axis:旋转轴
%输出：
%     Y:
%例子：y=func(1,'type1');
%注意事项：利用函数的适用范围。
%文档日期：
%标签：
%创建日期：
%最后更新日期：
%--------------------------------
if(~exist('m','var'))
    m = 180;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('n','var'))
    n = 64;  % 如果未出现该变量，则对其进行赋值
end
p = inputParser;            % 函数的输入解析器
addParameter(p,'mode','face');      % 设置变量名和默认参数
addParameter(p,'drawSphere',true);      % 设置变量名和默认参数
addParameter(p,'drawCone',true);      % 设置变量名和默认参数
addParameter(p,'drawLine',false);      % 设置变量名和默认参数
addParameter(p,'drawCircle',false);      % 设置变量名和默认参数
addParameter(p,'FaceAlpha',0.8);      % 设置变量名和默认参数
addParameter(p,'FaceColor','cyan');      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值


if p.Results.drawSphere
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
    hold on;
end
daspect([1 1 1]);

if p.Results.drawCircle
    drawCircle(c1,u1,cv,r1);
    hold on;
    drawCircle(c2,u2,cv,r2);
    hold on;
end
if p.Results.drawLine
    line([c1(1),c2(1)],[c1(2),c2(2)],[c1(3),c2(3)],'LineWidth',2,'Color','magenta');
    line([c1(1),L1(1)],[c1(2),L1(2)],[c1(3),L1(3)],'LineWidth',1);
    line([c1(1),R1(1)],[c1(2),R1(2)],[c1(3),R1(3)],'LineWidth',1);
    line([c2(1),L2(1)],[c2(2),L2(2)],[c2(3),L2(3)],'LineWidth',1);
    line([c2(1),R2(1)],[c2(2),R2(2)],[c2(3),R2(3)],'LineWidth',1);
end

[slabCone]=computeSlabCone(c1,r1,c2,r2);

if p.Results.drawCircle
    [X1,Y1,Z1]=drawCircleSector(slabCone.smallCircleCenter,axis,cv,slabCone.base,180,'Color','cyan');
    [X2,Y2,Z2]=drawCircleSector(slabCone.bigCircleCenter,axis,cv,slabCone.top,180,'Color','cyan');
end
if p.Results.drawCone

    [X1,Y1,Z1]=createCircleSector(slabCone.smallCircleCenter,cv,axis,radian,slabCone.base,m);
    [X2,Y2,Z2]=createCircleSector(slabCone.bigCircleCenter,cv,axis,radian,slabCone.top,m);
 
    drawCone(X1,Y1,Z1,X2,Y2,Z2,'mode',p.Results.mode,'FaceAlpha',p.Results.FaceAlpha,'FaceColor',p.Results.FaceColor);
    hold on;
    %draw the hidden part
%     [X1,Y1,Z1]=createCircleSector(slabCone.smallCircleCenter,-cv,axis,pi-radian,slabCone.base,m);
%     [X2,Y2,Z2]=createCircleSector(slabCone.bigCircleCenter,-cv,axis,pi-radian,slabCone.top,m);
%     drawCone(X1,Y1,Z1,X2,Y2,Z2,n,'mode',p.Results.mode,'FaceAlpha',p.Results.FaceAlpha,'FaceColor','magenta');
end
if p.Results.drawLine
    line([L1(1),L2(1)],[L1(2),L2(2)],[L1(3),L2(3)],'LineWidth',2,'Color','m');
    line([R1(1),R2(1)],[R1(2),R2(2)],[R1(3),R2(3)],'LineWidth',2,'Color','m');
end
%draw bounding box
[b1,t1]=computeBoundBoxForDiscSector(slabCone.smallCircleCenter,slabCone.base,axis,cv,radian);
[b2,t2]=computeBoundBoxForDiscSector(slabCone.bigCircleCenter,slabCone.top,axis,cv,radian);
bottom1=[min(b1(1),b2(1)),min(b1(2),b2(2)),min(b1(3),b2(3))];
top1=[max(t1(1),t2(1)),max(t1(2),t2(2)),max(t1(3),t2(3))];
% draw3DBoundingBox(b1(1),b1(2),b1(3),t1(1),t1(2),t1(3),'color','green');
% draw3DBoundingBox(b2(1),b2(2),b2(3),t2(1),t2(2),t2(3),'color','blue');
% draw3DBoundingBox(bottom1(1),bottom1(2),bottom1(3),top1(1),top1(2),top1(3),'color','blue');
% hold on;
% [bottom2,top2]=computeBoundBoxForFrustumCone(slabCone.smallCircleCenter,slabCone.base,slabCone.bigCircleCenter,slabCone.top);
% draw3DBoundingBox(bottom2(1),bottom2(2),bottom2(3),top2(1),top2(2),top2(3),'color','red');
end