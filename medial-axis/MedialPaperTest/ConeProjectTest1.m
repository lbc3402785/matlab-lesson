addpath(genpath('..'));
addpath(genpath('..\geometry'));
c0=[0,0,0];
c1=[7,0,0];
r0=4;
r1=3;
% [slabCone]=computeSlabCone(c0,r0,c1,r1);

[L1,R1,L2,R2,slabCone,cv]=drawMedialCone(c0,c1,r0,r1,180,64,'FaceAlpha',0.5);
hold on;
[u,v]=Utils.GenerateComplementBasis(slabCone.axis);
% w=c0-slabCone.axis*17-v;
w=[3.5,5,0]
text(w(1),w(2),w(3),sprintf('$$w$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
[fp,signeddist,seg]=slabCone.project(w);
% dot(seg.r-seg.q,w-fp)
line([fp(1),w(1)],[fp(2),w(2)],[fp(3),w(3)],'LineStyle','-','LineWidth',2,'Color','red');
hold on;
r=norm(fp-slabCone.apex)*sqrt(slabCone.sinThetaSqr/slabCone.cosThetaSqr);
w0=(r-r1)/(r0-r1);
w1=1-w0;
c=w0*c0+w1*c1;
sphere=Sphere(c,r);
text(c(1),c(2),c(3),sprintf('$$c$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
line([c0(1),c1(1)],[c0(2),c1(2)],[c0(3),c1(3)],'LineStyle','-','LineWidth',2,'Color','black');
% sphere.draw();
line([fp(1),c(1)],[fp(2),c(2)],[fp(3),c(3)],'LineStyle','-','LineWidth',2,'Color','blue');
[fp1,signeddist1]=sphere.project(w);
disp(cross(w-fp,c-fp));
disp(fp);
disp(fp1);
grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;