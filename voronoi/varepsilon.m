x=-6:0.1:6;
y=-6:0.1:6;
[X,Y]=meshgrid(x,y);
Z=X.*X+Y.*Y;
surf(X,Y,Z,'FaceAlpha',0.9,'EdgeColor','none','FaceColor', 'yellow');
hold on;
%plane 1
sigma1=1;
sigma2=2;
Z1=2*sigma1*X+2*sigma2*Y-(sigma1*sigma1+sigma2*sigma2);
surf(X,Y,Z1,'FaceAlpha',0.1,'EdgeColor','none','FaceColor', 'cyan');
hold on;
scatter3(sigma1,sigma2,sigma1*sigma1+sigma2*sigma2,'filled','MarkerFaceColor','red');
%plot3(X,Y,Z,'o','Color',[0,0.7,0.9]);
text(sigma1,sigma2,sigma1*sigma1+sigma2*sigma2,sprintf('$$\\varepsilon(p_{1})$$'),'Interpreter', 'latex','HorizontalAlignment','center','FontSize',12);
%plane 2
sigma1=-1;
sigma2=3;
Z1=2*sigma1*X+2*sigma2*Y-(sigma1*sigma1+sigma2*sigma2);
surf(X,Y,Z1,'FaceAlpha',0.1,'EdgeColor','none','FaceColor', 'cyan');
hold on;
scatter3(sigma1,sigma2,sigma1*sigma1+sigma2*sigma2,'filled','MarkerFaceColor','red');
%plot3(X,Y,Z,'o','Color',[0,0.7,0.9]);
text(sigma1,sigma2,sigma1*sigma1+sigma2*sigma2,sprintf('$$\\varepsilon(p_{2})$$'),'Interpreter', 'latex','HorizontalAlignment','center','FontSize',12);
%plane 3
sigma1=-2;
sigma2=-1;
Z1=2*sigma1*X+2*sigma2*Y-(sigma1*sigma1+sigma2*sigma2);
surf(X,Y,Z1,'FaceAlpha',0.1,'EdgeColor','none','FaceColor', 'cyan');
hold on;
scatter3(sigma1,sigma2,sigma1*sigma1+sigma2*sigma2,'filled','MarkerFaceColor','red');
%plot3(X,Y,Z,'o','Color',[0,0.7,0.9]);
text(sigma1,sigma2,sigma1*sigma1+sigma2*sigma2,sprintf('$$\\varepsilon(p_{3})$$'),'Interpreter', 'latex','HorizontalAlignment','center','FontSize',12);
grid off;