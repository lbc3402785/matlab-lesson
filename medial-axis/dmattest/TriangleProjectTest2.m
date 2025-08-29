%addpath(genpath('..'));
addpath(genpath('..\geometry'));

a=[1,0,0];
b=[3,4,0];
c=[6,-2,0];
tri=Triangle(a,b,c);
p=(a+b+c)/3-tri.normal;
tri.draw(0.5)

[fp]=tri.projToTri(p);
text(a(1),a(2),a(3),sprintf('$$A$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
text(b(1),b(2),b(3),sprintf('$$B$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
text(c(1),c(2),c(3),sprintf('$$C$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
text(p(1),p(2),p(3),sprintf('$$p$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
text(fp(1),fp(2),fp(3),sprintf('$$fp$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
line([fp(1),p(1)],[fp(2),p(2)],[fp(3),p(3)],'LineStyle','-','LineWidth',2,'Color','red');
hold on;
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
