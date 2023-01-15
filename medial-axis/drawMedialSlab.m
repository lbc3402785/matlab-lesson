function [V1_UP,V1_DOWN,O1,A1,B1,V2_UP,V2_DOWN,O2,A2,B2,V3_UP,V3_DOWN,O3,A3,B3]=drawMedialSlab(c1,c2,c3,r1,r2,r3,m,n,b1,b2,b3,varargin)
if(~exist('m','var'))
    m = 180;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('n','var'))
    n = 64;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('b1','var'))
    b1 = false;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('b2','var'))
    b2 = false;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('b1','var'))
    b2 = false;  % 如果未出现该变量，则对其进行赋值
end
p = inputParser;            % 函数的输入解析器
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


% P=transpose([c1;c2;c3]);
% X=P(1,:);
% Y=P(2,:);
% Z=P(3,:);
% T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',1);
% hold on;
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
[st0,st1,success]=TriangleFromThreeSpheres(pos(1,:),radius(1),pos(2,:),radius(2,:),pos(3,:),radius(3));
if ~success
    disp('TriangleFromThreeSpheres error!');
    return;
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
%--------------------------------------------------
% P=transpose([c1;c2;c3]);
% X=P(1,:);
% Y=P(2,:);
% Z=P(3,:);
% T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',1);

n0=st0.normal;
n1=st1.normal;
V1_UP=c1+r1*n0;
V1_DOWN=c1+r1*n1;
V2_UP=c2+r2*n0;
V2_DOWN=c2+r2*n1;
V3_UP=c3+r3*n0;
V3_DOWN=c3+r3*n1;
cv12=c31-dot(c31,c12)*c12;
cv12=cv12/norm(cv12);
if(abs(dot(cv12,n0)-dot(cv12,n1))>1e-5)
    disp('normal compute accurate!');
end
radian12=acos((dot(cv12,n0)+dot(cv12,n1))*0.5);

cv13=c21-dot(c21,c13)*c13;
cv13=cv13/norm(cv13);
if(abs(dot(cv13,n0)-dot(cv13,n1))>1e-5)
    disp('normal compute accurate!');
end
radian13=acos((dot(cv13,n0)+dot(cv13,n1))*0.5);

cv23=c12-dot(c12,c23)*c23;
cv23=cv23/norm(cv23);
if(abs(dot(cv23,n0)-dot(cv23,n1))>1e-5)
    disp('normal compute accurate!');
end
radian23=acos((dot(cv23,n0)+dot(cv23,n1))*0.5);
%--------------------------------------------------
P=transpose([V1_UP;V2_UP;V3_UP]);
X=P(1,:);
Y=P(2,:);
Z=P(3,:);
T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor',[0,0.69,0.941],'FaceAlpha',1);
% trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',p.Results.FaceColor,'FaceAlpha',1);
%--------------------------------------------------
P=transpose([V1_DOWN;V2_DOWN;V3_DOWN]);
X=P(1,:);
Y=P(2,:);
Z=P(3,:);
T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor', [0,0.69,0.941],'FaceAlpha',1);
% trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',p.Results.FaceColor,'FaceAlpha',1);
hold on;


%draw slab cone
drawPartMedialCone(c1,c2,r1,r2,V1_UP,V1_DOWN,V2_UP,V2_DOWN,cv12,c12,radian12,m,n,'drawSphere',false,'drawLine',false,'FaceColor','cyan');
hold on;
drawPartMedialCone(c1,c3,r1,r3,V1_UP,V1_DOWN,V3_UP,V3_DOWN,cv13,c13,radian13,m,n,'drawSphere',false,'drawLine',false,'FaceColor','cyan');
hold on;
drawPartMedialCone(c2,c3,r2,r3,V2_UP,V2_DOWN,V3_UP,V3_DOWN,cv23,c23,radian23,m,n,'drawSphere',false,'drawLine',false,'FaceColor','cyan');
hold on;
end