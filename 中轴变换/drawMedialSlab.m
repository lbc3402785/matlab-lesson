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
c12=c2-c1;
c13=c3-c1;
c23=c3-c2;
c21=-c12;
c31=-c13;
c32=-c23;

[~,~,~,~,~,cos_phi_21,~]=drawMedialCone(c1,c2,r1,r2,m,n,'mode','face','drawLine',false,'drawCircle',true,'drawCone',true,'FaceAlpha',0.1);
[~,~,~,~,~,cos_phi_31,~]=drawMedialCone(c1,c3,r1,r3,m,n,'mode','face','drawLine',false,'drawCircle',true,'drawCone',true,'FaceAlpha',0.1);
[~,~,~,~,~,cos_phi_32,~]=drawMedialCone(c2,c3,r2,r3,m,n,'mode','face','drawLine',false,'drawCircle',true,'drawCone',true,'FaceAlpha',0.1);
P=transpose([c1;c2;c3]);
X=P(1,:);
Y=P(2,:);
Z=P(3,:);
T=[1,2,3];
trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',0.1);

[V1_UP,V1_DOWN,O1,A1,B1]=getSlabTangentPair(c1,r1,c12,c13,-cos_phi_21,-cos_phi_31,'drawLine',b1);

[V2_UP,V2_DOWN,O2,A2,B2]=getSlabTangentPair(c2,r2,c23,c21,-cos_phi_32,cos_phi_21,'drawLine',b2);

[V3_UP,V3_DOWN,O3,A3,B3]=getSlabTangentPair(c3,r3,c31,c32,cos_phi_31,cos_phi_32,'drawLine',b3);

P=transpose([V1_UP;V2_UP;V3_UP]);
X=P(1,:);
Y=P(2,:);
Z=P(3,:);
T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor',[0,0.69,0.941],'FaceAlpha',1);
trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',0.1);
P=transpose([V1_DOWN;V2_DOWN;V3_DOWN]);
X=P(1,:);
Y=P(2,:);
Z=P(3,:);
T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor', [0,0.69,0.941],'FaceAlpha',1);
trisurf(T,X,Y,Z,'EdgeColor','none','FaceColor',[0.3010 0.7450 0.9330],'FaceAlpha',0.1);

end