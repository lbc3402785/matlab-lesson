function [V1_UP,V1_DOWN,O1,A1,B1,V2_UP,V2_DOWN,O2,A2,B2,V3_UP,V3_DOWN,O3,A3,B3]=drawMedialSlab(c1,c2,c3,r1,r2,r3,m,n,b1,b2,b3,varargin)
if(~exist('m','var'))
    m = 180;  % ���δ���ָñ������������и�ֵ
end
if(~exist('n','var'))
    n = 64;  % ���δ���ָñ������������и�ֵ
end
if(~exist('b1','var'))
    b1 = false;  % ���δ���ָñ������������и�ֵ
end
if(~exist('b2','var'))
    b2 = false;  % ���δ���ָñ������������и�ֵ
end
if(~exist('b1','var'))
    b2 = false;  % ���δ���ָñ������������и�ֵ
end
p = inputParser;            % ���������������
addParameter(p,'drawSphere',true);      % ���ñ�������Ĭ�ϲ���
addParameter(p,'FaceAlpha',0.5);      % ���ñ�������Ĭ�ϲ���
parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ
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


P=transpose([c1;c2;c3]);
X=P(1,:);
Y=P(2,:);
Z=P(3,:);
T=[1,2,3];
trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',1);

[st0,st1,success]=TriangleFromThreeSpheres(c1,r1,c2,r2,c3,r3);
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
end
daspect([1 1 1]);
%--------------------------------------------------
P=transpose([c1;c2;c3]);
X=P(1,:);
Y=P(2,:);
Z=P(3,:);
T=[1,2,3];
trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',1);

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
%--------------------------------------------------
% P=transpose([V1_UP;V2_UP;V3_UP]);
% X=P(1,:);
% Y=P(2,:);
% Z=P(3,:);
% T=[1,2,3];
% % trisurf(T,X,Y,Z,'FaceColor',[0,0.69,0.941],'FaceAlpha',1);
% trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
%--------------------------------------------------
% P=transpose([V1_DOWN;V2_DOWN;V3_DOWN]);
% X=P(1,:);
% Y=P(2,:);
% Z=P(3,:);
% T=[1,2,3];
% % trisurf(T,X,Y,Z,'FaceColor', [0,0.69,0.941],'FaceAlpha',1);
% trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',1);
hold on;


%draw slab cone
drawPartMedialCone(c1,c2,r1,r2,V1_UP,V1_DOWN,V2_UP,V2_DOWN,cv12,c12,radian12,m,n,'drawSphere',false,'drawLine',true);
end