r=1;
sigma1=2;
sigma2=3;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + sigma1;
yunit = r * sin(th) + sigma2;
h = fill(xunit, yunit,'k');
hold on;
x=-6:0.1:6;
y=-6:0.1:6;
[X,Y]=meshgrid(x,y);
Z=X.*X+Y.*Y;
surf(X,Y,Z,'FaceAlpha',0.9,'EdgeColor','none','FaceColor', 'cyan');
zunit=xunit.*xunit+yunit.*yunit;
ZE=2*sigma1*X+2*sigma2*Y-(sigma1.*sigma1+sigma2.*sigma2-r.*r);
surf(X,Y,ZE,'FaceAlpha',0.9,'EdgeColor','none','FaceColor', 'yellow');
[M,N]=size(xunit(1,:));
for i=1:N
    X=[xunit(1,i),xunit(1,i)];
    Y=[yunit(1,i),yunit(1,i)];
    Z=[zunit(1,i),0];
    line(X,Y,Z,'LineWidth',1,'Color','red');
end