addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[3,3,0];
c2=[-3,-3,0];
c3=[-2,2,0];



r1=3;
r2=3;
r3=2;
% [slab,success]=computeMedialSlab(c1,c2,c3,r1,r2,r3);
[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceAlpha',0.5);
% p=[2,0.5,4];
% p=[5,2,4];
% p=[2,1,4];
% p=[2,1,-4];
% p=[-2,1,-4];
% p=[2,-3,-4];
% p=[0.5,0,0];
p=[-1,1.5,0];
[u,v,w,fp,signeddist]=slab.project(p);
% c=c1*u+c2*v+c3*w;
% r=r1*u+r2*v+r3*w;
% [x,y,z] = sphere(128);
% x=x*r+c(1);
% y=y*r+c(2);
% z=z*r+c(3);
% h = surf(x, y, z);
% set(h,'FaceColor','yellow','FaceAlpha',1,'FaceLighting','gouraud','EdgeColor','none');%phong

text(p(1),p(2),p(3),sprintf('$$p$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
text(fp(1),fp(2),fp(3),sprintf('$$fp$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
line([fp(1),p(1)],[fp(2),p(2)],[fp(3),p(3)],'LineStyle','-','LineWidth',2,'Color','red');
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;