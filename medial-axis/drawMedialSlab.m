function [slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,m,n,b1,b2,b3,varargin)
if(~exist('m','var'))
    m = 180;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('n','var'))
    n = 64;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('b1','var'))
    b1 = true;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('b2','var'))
    b2 = true;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('b3','var'))
    b3 = true;  % 如果未出现该变量，则对其进行赋值
end
p = inputParser;            % 函数的输入解析器
addParameter(p,'drawTriangle',true);      % 设置变量名和默认参数
addParameter(p,'TriangleColor',[54/255 195/255 201/255]);      % 设置变量名和默认参数
addParameter(p,'drawSphere',true);      % 设置变量名和默认参数
addParameter(p,'FaceColor','cyan');      % 设置变量名和默认参数
addParameter(p,'FaceAlpha',1);      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
%--------------------------------------------------------------------------
c12=c2-c1;
c12=c12/norm(c12);
c13=c3-c1;
c13=c13/norm(c13);
c23=c3-c2;
c23=c23/norm(c23);
c21=-c12;
c31=-c13;
c32=-c23;
% 
% if p.Results.drawTriangle
%     P=transpose([c1;c2;c3]);
%     X=P(1,:);
%     Y=P(2,:);
%     Z=P(3,:);
%     T=[1,2,3];
%     trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',1);
%     hold on;
% end
%be sure the first sphere is the biggest sphere
pos=[c1;c2;c3];
radius=[r1;r2;r3];
if radius(1)<radius(2)
    tmp=pos(1,:);
    pos(1,:)=pos(2,:);
    pos(2,:)=tmp;
    tmpR=radius(1);
    radius(1)=radius(2);
    radius(2)=tmpR;
end
if radius(1)<radius(3)
    tmp=pos(1,:);
    pos(1,:)=pos(3,:);
    pos(3,:)=tmp;
    tmpR=radius(1);
    radius(1)=radius(3);
    radius(3)=tmpR;
end

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
    [x3,y3,z3] = sphere(128);
    x3=x3*r3+c3(1);
    y3=y3*r3+c3(2);
    z3=z3*r3+c3(3);
    h3 = surf(x3, y3, z3);
    set(h3,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor','none')
    hold on;
end
daspect([1 1 1]);
[slab,success]=computeMedialSlab(c1,c2,c3,r1,r2,r3);
%[slab.st0,slab.st1,n0,n1,success]=TriangleFromThreeSpheres(pos(1,:),radius(1),pos(2,:),radius(2,:),pos(3,:),radius(3));
if ~success
    disp('computeMedialSlab error!');
    return;
end

%--------------------------------------------------
% P=transpose([c1;c2;c3]);
% X=P(1,:);
% Y=P(2,:);
% Z=P(3,:);
% T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',1);
% hold on;

slab.cv12=c31-dot(c31,c12)*c12;
slab.cv12=slab.cv12/norm(slab.cv12);
t0=slab.n0-dot(slab.n0,c12)*c12;
t0=t0/norm(t0);
t1=slab.n1-dot(slab.n1,c12)*c12;
t1=t1/norm(t1);
if(abs(dot(slab.cv12,t0)-dot(slab.cv12,t1))>1e-5)
    disp('normal compute accurate!');
end
slab.radian12=acos((dot(slab.cv12,t0)+dot(slab.cv12,t1))*0.5);

slab.cv13=c21-dot(c21,c13)*c13;
slab.cv13=slab.cv13/norm(slab.cv13);
t0=slab.n0-dot(slab.n0,c13)*c13;
t0=t0/norm(t0);
t1=slab.n1-dot(slab.n1,c13)*c13;
t1=t1/norm(t1);
if(abs(dot(slab.cv13,t0)-dot(slab.cv13,t1))>1e-5)
    disp('normal compute accurate!');
end
slab.radian13=acos((dot(slab.cv13,t0)+dot(slab.cv13,t1))*0.5);

slab.cv23=c12-dot(c12,c23)*c23;
slab.cv23=slab.cv23/norm(slab.cv23);
t0=slab.n0-dot(slab.n0,c23)*c23;
t0=t0/norm(t0);
t1=slab.n1-dot(slab.n1,c23)*c23;
t1=t1/norm(t1);
if(abs(dot(slab.cv23,t0)-dot(slab.cv23,t1))>1e-5)
    disp('normal compute accurate!');
end
slab.radian23=acos((dot(slab.cv23,t0)+dot(slab.cv23,t1))*0.5);
%draw triangle
if p.Results.drawTriangle
    P=transpose([c1;c2;c3]);
    X=P(1,:);
    Y=P(2,:);
    Z=P(3,:);
    T=[1,2,3];
    % trisurf(T,X,Y,Z,'FaceColor',[0,0.69,0.941],'FaceAlpha',1);
    % trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
    trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor','yellow','FaceAlpha',1);
    hold on;
    %--------------------------------------------------
    P=transpose([slab.V1_UP;slab.V2_UP;slab.V3_UP]);
    X=P(1,:);
    Y=P(2,:);
    Z=P(3,:);
    T=[1,2,3];
    % trisurf(T,X,Y,Z,'FaceColor',[0,0.69,0.941],'FaceAlpha',1);
    % trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
    trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',p.Results.TriangleColor,'FaceAlpha',p.Results.FaceAlpha);
    hold on;
    %--------------------------------------------------
    P=transpose([slab.V1_DOWN;slab.V2_DOWN;slab.V3_DOWN]);
    X=P(1,:);
    Y=P(2,:);
    Z=P(3,:);
    T=[1,2,3];
    % trisurf(T,X,Y,Z,'FaceColor', [0,0.69,0.941],'FaceAlpha',1);
    % trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
    trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',p.Results.TriangleColor,'FaceAlpha',p.Results.FaceAlpha);
    hold on;
end


% [slab.slabCone12]=computeSlabCone(c1,r1,c2,r2);
% [slab.slabCone13]=computeSlabCone(c1,r1,c3,r3);
% [slab.slabCone23]=computeSlabCone(c2,r2,c3,r3);
%draw slab cone
if(b1)
%     drawMedialCone(c1,c2,r1,r2,m,n,'FaceAlpha',p.Results.FaceAlpha);
    
    drawPartMedialCone(c1,c2,r1,r2,slab.V1_UP,slab.V1_DOWN,slab.V2_UP,slab.V2_DOWN,slab.cv12,c12,slab.radian12,m,n,'drawSphere',false,'drawLine',false,'FaceColor','cyan','FaceAlpha',p.Results.FaceAlpha);
    hold on;
end
if(b2)
%     drawMedialCone(c1,c3,r1,r3,m,n,'FaceAlpha',p.Results.FaceAlpha);
    
    drawPartMedialCone(c1,c3,r1,r3,slab.V1_UP,slab.V1_DOWN,slab.V3_UP,slab.V3_DOWN,slab.cv13,c13,slab.radian13,m,n,'drawSphere',false,'drawLine',false,'FaceColor','cyan','FaceAlpha',p.Results.FaceAlpha);
    hold on;
end
if(b3)
%     drawMedialCone(c2,c3,r2,r3,m,n,'FaceAlpha',p.Results.FaceAlpha);
    
%     drawDiscSector(slabCone23.smallCenter,slabCone23.base,c23,cv23,radian23,'FaceColor','red');
%     drawDiscSector(slabCone23.bigCenter,slabCone23.top,c23,cv23,radian23,'FaceColor','red');
    drawPartMedialCone(c2,c3,r2,r3,slab.V2_UP,slab.V2_DOWN,slab.V3_UP,slab.V3_DOWN,slab.cv23,c23,slab.radian23,m,n,'drawSphere',false,'drawLine',false,'FaceColor','cyan','FaceAlpha',p.Results.FaceAlpha);
    hold on;
end
end