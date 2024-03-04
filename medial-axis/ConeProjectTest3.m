addpath(genpath('..'));
addpath(genpath('..\geometry'));
c0=[0.044556 ,0.0148795, -0.00570416];
c1=[0.0443442, 0.0151245, -0.00568535];
r0=0.00393382;
r1=0.00425826;
% [slabCone]=computeSlabCone(c0,r0,c1,r1);
text(c0(1),c0(2),c0(3),sprintf('$$c_0$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
text(c1(1),c1(2),c1(3),sprintf('$$c_1$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
hold on;
[L1,R1,L2,R2,slabCone,cv]=drawMedialCone(c0,r0,c1,r1,180,64,'FaceAlpha',0.5);
hold on;
[u,v]=Utils.GenerateComplementBasis(slabCone.axis);
%  w=c0-slabCone.axis*17-v;
% w=[-0.5,0,0];
% w=[0.5,0,0];
% w=[2.6,6,0];
% w=[13.4,2,0];
% w=[9,5,-2];
%  w=[7.5,0,0];
% w=[-0.5,0,0];
% w=[-0.1,5,0];
% w=[1.7,-1,0];
% w=[3.5,0,2];
w=[0.024752, 0.002891, -0.132067];
text(w(1),w(2),w(3),sprintf('$$w$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
[c,r,fp,signeddist,seg]=slabCone.project(w);
disp(signeddist);
if signeddist>0
    disp('outside!');
else
    disp('inside!');
end
% dot(seg.r-seg.q,w-fp)
text(fp(1),fp(2),fp(3),sprintf('$$fp$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
line([fp(1),w(1)],[fp(2),w(2)],[fp(3),w(3)],'LineStyle','-','LineWidth',2,'Color','red');
hold on;

sphere=Sphere(c,r);
text(c(1),c(2),c(3),sprintf('$$c$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',18,'Color','red');
line([c0(1),c1(1)],[c0(2),c1(2)],[c0(3),c1(3)],'LineStyle','-','LineWidth',2,'Color','black');
% sphere.draw();
line([fp(1),c(1)],[fp(2),c(2)],[fp(3),c(3)],'LineStyle','-','LineWidth',2,'Color','blue');

grid off;
hold off;
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;