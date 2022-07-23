function drawCone(c1,c2,r1,r2,m,n,varargin)
if(~exist('m','var'))
    m = 180;  % 如果未出现该变量，则对其进行赋值
end
if(~exist('n','var'))
    n = 64;  % 如果未出现该变量，则对其进行赋值
end
p = inputParser;            % 函数的输入解析器
addParameter(p,'mode','face');      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
%r1=3;
%r2=1;
%n=36;
%c1=[2,2,4];
%c2=[8,2,3];
c12=c2-c1;
d0=[0,1,0];
cu=c12/norm(c12);
cos_phi = (r2-r1)/norm(c12);%cos(\phi)/norm(c12)
d2=sumsqr(c12);
sin_phi = sqrt(d2-(r2-r1)^2)/norm(c12); %sin(\phi)/norm(c12) <-- 如果 d2<(r2-r1)^2，则无解

u1=(-cos_phi*cu+sin_phi*d0);
u2=(-cos_phi*cu-sin_phi*d0);
L1 = c1+r1*u1; L2 = c2+r2*u1; % 左线切点
R1 = c1+r1*u2; R2 = c2+r2*u2; % 右线切点
cv=cross(cu,d0);
cv=cv/norm(cv);

[x1,y1,z1] = sphere(128);
x1=x1*r1+c1(1);
y1=y1*r1+c1(2);
z1=z1*r1+c1(3);
h1 = surf(x1, y1, z1);
set(h1,'FaceColor',[0.807 0.6390 0.6156],'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')

hold on;
[x2,y2,z2] = sphere(128);
x2=x2*r2+c2(1);
y2=y2*r2+c2(2);
z2=z2*r2+c2(3);
h2 = surf(x2, y2, z2);
set(h2,'FaceColor',[0.807 0.6390 0.6156],'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')
%set(h2, 'FaceColor', [1 0 0])
daspect([1 1 1]);

th = 0:pi/50:2*pi;
qs=transpose([cos(th/2);sin((th/2))*cv(1);sin((th/2))*cv(2);sin((th/2))*cv(3)]);
P1=r1*quatrotate(qs,u1);
P2=r2*quatrotate(qs,u2);
X=P1(:,1)+c1(1);
Y=P1(:,2)+c1(2);
Z=P1(:,3)+c1(3);
plot3(X, Y, Z,'Color','m','LineWidth',2);
X=P2(:,1)+c2(1);
Y=P2(:,2)+c2(2);
Z=P2(:,3)+c2(3);
plot3(X, Y, Z,'Color','m','LineWidth',2);
%rectangle('Position',[a1-r1,b1-r1,2*r1,2*r1],'Curvature',[1,1],'EdgeColor','m','LineWidth',2)
%rectangle('Position',[a2-r2,b2-r2,2*r2,2*r2],'Curvature',[1,1],'EdgeColor','m','LineWidth',2)
line([c1(1),c2(1)],[c1(2),c2(2)],[c1(3),c2(3)],'LineWidth',1);
line([c1(1),L1(1)],[c1(2),L1(2)],[c1(3),L1(3)],'LineWidth',1);
line([c1(1),R1(1)],[c1(2),R1(2)],[c1(3),R1(3)],'LineWidth',1);
line([c2(1),L2(1)],[c2(2),L2(2)],[c2(3),L2(3)],'LineWidth',1);
line([c2(1),R2(1)],[c2(2),R2(2)],[c2(3),L2(3)],'LineWidth',1);

srl=norm(L1-R1)*0.5;
srr=norm(L2-R2)*0.5;

th = 0:pi/m:2*pi;
qs=transpose([cos(th/2);sin((th/2))*cu(1);sin((th/2))*cu(2);sin((th/2))*cu(3)]);
v1=(L1-R1)*0.5;
v1=v1/norm(v1);
v2=(L2-R2)*0.5;
v2=v2/norm(v2);
P1=srl*quatrotate(qs,v1);
P2=srr*quatrotate(qs,v2);
X1=P1(:,1)+(L1(1)+R1(1))*0.5;
Y1=P1(:,2)+(L1(2)+R1(2))*0.5;
Z1=P1(:,3)+(L1(3)+R1(3))*0.5;
plot3(X1, Y1, Z1,'Color','cyan')
X2=P2(:,1)+(L2(1)+R2(1))*0.5;
Y2=P2(:,2)+(L2(2)+R2(2))*0.5;
Z2=P2(:,3)+(L2(3)+R2(3))*0.5;
plot3(X2, Y2, Z2,'Color','cyan')

if strcmp(p.Results.mode,'face')==1
    X=X1;
    Y=Y1;
    Z=Z1;
    for i=1:n
        XI=(X2-X1)*i/n+X1;
        YI=(Y2-Y1)*i/n+Y1;
        ZI=(Z2-Z1)*i/n+Z1;
        X=cat(2,X,XI);
        Y=cat(2,Y,YI);
        Z=cat(2,Z,ZI);
    end
    
    h=surf(X,Y,Z);
    set(h,'FaceColor','cyan','FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')
else
    X=reshape(transpose([X1(:,1),X2(:,1)]), 1, []);
    Y=reshape(transpose([Y1(:,1),Y2(:,1)]), 1, []);
    Z=reshape(transpose([Z1(:,1),Z2(:,1)]), 1, []);
    line(X,Y,Z,'LineWidth',1,'Color','cyan');
end
line([L1(1),L2(1)],[L1(2),L2(2)],[L1(3),L2(3)],'LineWidth',2,'Color','m');
line([R1(1),R2(1)],[R1(2),R2(2)],[R1(3),R2(3)],'LineWidth',2,'Color','m');
grid off;
hold off;
axis off;
camlight
end