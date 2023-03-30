addpath(genpath('..'));
addpath(genpath('..\geometry'));
%0-->195 247 248
%114-->247 248 563

% c1=[302.795593,106.758308,160.064377];
% c2=[306.025604,109.183693,159.386490];
% c3=[303.897369,112.722260,161.973648];
% c4=[298.250458,117.756317,150.924179];
%4-->315 318 326
%648-->210 721 817
c1=[329.015411,140.410889,150.653885];%315
c2=[337.155243,129.177353,158.886230];%318
c3=[328.787750,127.216011,162.243774];%326
r1=12.6837769;
r2=23.0233116;
r3=19.2433262;

c4=[339.573639,139.892365,157.517105];%210
c5=[326.919556,145.179565,169.630524];%721
c6=[339.118073,135.567078,156.323135];%817
r4=21.5034866;
r5=11.0898609;
r6=20.9712620;



% r1=12.7788582;
% r2=12.8932352;
% r3=11.4964924;
% r4=2.05299497;




% [slab123,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceColor','blue','drawSphere',false);
%  [slab234,success]=drawMedialSlab(c2,c3,c4,r2,r3,r4,180,64,true,true,true,'FaceColor','red','drawSphere',false);
% P=transpose([c1;c2;c3]);
% X=P(1,:);
% Y=P(2,:);
% Z=P(3,:);
% T=[1,2,3];
% trisurf(T,X,Y,Z,'FaceColor','yellow','FaceAlpha',1);
hold on;
[slab123,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceColor','blue','drawSphere',false);
[slab456,success]=drawMedialSlab(c4,c5,c6,r4,r5,r6,180,64,true,true,true,'FaceColor','red','drawSphere',false);

hold on;

grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;