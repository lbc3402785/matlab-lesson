%addpath(genpath('..'));
addpath(genpath('..\geometry'));

a=[1,0,0];
b=[3,4,0];
c=[6,-2,0];
tri=Triangle(a,b,c);
p=(a+b)*0.5+[0,0,-2];
tri.draw()

[u,v,w,fp,signeddist]=tri.project(p);
disp(u*a+v*b+w*c-fp);
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
