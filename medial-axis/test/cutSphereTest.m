% c1=[3,6,0];
% c2=[10,3,0];
% c3=[-5,2,0];
c1=[3,0,0];
c2=[9,0,0];

r1=4;
r2=1;

figure;
[L1,R1,L2,R2,slabCone12,cv]=drawMedialCone(c1,c2,r1,r2,180,64,'FaceAlpha',0.5);
hold on;
c21=c1-c2;
c21=c21/norm(c21);
c1L1=L1-c1;
c1L1=c1L1/norm(c1L1);
radian12=acos(dot(c1L1,c21));
radian12=0.5*pi;
if(abs(r1-r2)>1e-5)
    radian12=0.5*pi-acos(sqrt(slabCone12.cosThetaSqr));
end
radian12=0.5*pi-acos(sqrt(slabCone12.cosThetaSqr));
if r1>r2
    radian12=pi-radian12;
end
[bottom12,top12]=computeBoundingBoxForSphericalCap(c21,radian12);
bottom12=bottom12*r1+c1;
top12=top12*r1+c1;
drawSphericalCap(c1,r1,c21,radian12,'FaceColor',[0.807 0.6390 0.6156]);
hold on;
draw3DBoundingBox(bottom12(1),bottom12(2),bottom12(3),top12(1),top12(2),top12(3),'color','blue');
c12=-c21;

c2L2=L2-c2;
c2L2=c2L2/norm(c2L2);
radian21=acos(dot(c2L2,c12));
radian21=0.5*pi;
if(abs(r1-r2)>1e-5)
    radian21=0.5*pi-acos(sqrt(slabCone12.cosThetaSqr));
end
radian21=0.5*pi-acos(sqrt(slabCone12.cosThetaSqr));
if r2>r1
    radian21=pi-radian21;
end
% drawSphericalCap(c2,r2,c12,radian21,'FaceColor',[0.807 0.6390 0.6156]);
grid off;
hold off;
axis off;
% ka= 0.7;
% kd= 0.84;
% ks= 0.4;
% shine=120;
% material([ka kd ks shine]);
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
%light('Color',[0.8, 0.8, 0.8],'Position',[-10 10 -10],'Style','infinite');
%light('Color',[0.8, 0.8, 0.8],'Position',[0 0 -10],'Style','infinite');

camlight;