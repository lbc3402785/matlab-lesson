addpath(genpath('..'));
addpath(genpath('..\geometry'));
c1=[363.038391+5,173.360779,172.786880];%15
c2=[361.692108,171.739700,170.366302];%16
c3=[363.127563,170.929092,170.215347];%117

c4=[362.185730,171.603958,173.231659];%1696


c5=[359.791779,167.331497,165.977859];%827

center=(c1+c2+c3)/3;

r1=1.63569260;%15
r2=1.18762290;%16
r3=1.26848865;%117

r4=0.958481908;%1696
r5=6.06894541;%827


c12=c2-c1;
c13=c3-c1;
fn=cross(c12,c13);
fn=fn/norm(fn);


%[V1_UP,V1_DOWN,O1,A1,B1,V2_UP,V2_DOWN,O2,A2,B2,V3_UP,V3_DOWN,O3,A3,B3]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,false,false,false);
[slab,success]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,true,true,true,'FaceColor','red');
V1_UP=slab.V1_UP;
V2_UP=slab.V2_UP;
V3_UP=slab.V3_UP;
tri=Triangle(V1_UP,V2_UP,V3_UP);

% text(V1_UP(1)-fn(1)*0.1,V1_UP(2)-fn(2)*0.1,V1_UP(3)-fn(3)*0.1,sprintf('$$V_{1}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V1_DOWN(1)+fn(1)*0.1,V1_DOWN(2)+fn(2)*0.1,V1_DOWN(3)+fn(3)*0.1,sprintf('$$V_{1}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V2_UP(1)-fn(1)*0.1,V2_UP(2)-fn(2)*0.1,V2_UP(3)-fn(3)*0.1,sprintf('$$V_{2}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V2_DOWN(1)+fn(1)*0.1,V2_DOWN(2)+fn(2)*0.1,V2_DOWN(3)+fn(3)*0.1,sprintf('$$V_{2}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V3_UP(1)-fn(1)*0.1,V3_UP(2)-fn(2)*0.1,V3_UP(3)-fn(3)*0.1,sprintf('$$V_{3}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V3_DOWN(1)+fn(1)*0.1,V3_DOWN(2)+fn(2)*0.1,V3_DOWN(3)+fn(3)*0.1,sprintf('$$V_{3}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');

% c14=c4-c1;
% fn=cross(c14,c12);
% fn=fn/norm(fn);
[slab,success]=drawMedialSlab(c2,c3,c4,r2,r3,r4,180,64,true,true,true,'FaceColor','blue');
V1_UP=slab.V1_UP;
V2_UP=slab.V2_UP;
V4_UP=slab.V3_UP;
V1_DOWN=slab.V1_DOWN;
V2_DOWN=slab.V2_DOWN;
V4_DOWN=slab.V3_DOWN;
% v23=V3_UP-V2_UP;
% v24=V4_UP-V2_UP;
% fn=cross(v23,v24);
% fn=fn/norm(fn);
% planeD=-dot(V2_UP,fn);
% plane=Plane(fn,planeD);
% 
% [outSegTips]=trianglePlaneIntersection(plane,tri);
% drawMedialSlab(c2,c3,c5,r2,r3,r5,180,64,true,true,true,'FaceColor','magenta');
% text(V1_UP(1)-fn(1)*0.1,V1_UP(2)-fn(2)*0.1,V1_UP(3)-fn(3)*0.1,sprintf('$$V_{1}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V1_DOWN(1)+fn(1)*0.1,V1_DOWN(2)+fn(2)*0.1,V1_DOWN(3)+fn(3)*0.1,sprintf('$$V_{1}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V2_UP(1)-fn(1)*0.1,V2_UP(2)-fn(2)*0.1,V2_UP(3)-fn(3)*0.1,sprintf('$$V_{2}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V2_DOWN(1)+fn(1)*0.1,V2_DOWN(2)+fn(2)*0.1,V2_DOWN(3)+fn(3)*0.1,sprintf('$$V_{2}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V4_UP(1)-fn(1)*0.1,V4_UP(2)-fn(2)*0.1,V4_UP(3)-fn(3)*0.1,sprintf('$$V_{4}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V4_DOWN(1)+fn(1)*0.1,V4_DOWN(2)+fn(2)*0.1,V4_DOWN(3)+fn(3)*0.1,sprintf('$$V_{4}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');


%[V2_UP,V2_DOWN,O2,A2,B2,V3_UP,V3_DOWN,O3,A3,B3,V4_UP,V4_DOWN,O4,A4,B4]=drawMedialSlab(c2,c3,c4,r2,r3,r4,180,64,false,false,false);
% fn_skim=A1-O1;
% fn_skim=fn_skim/norm(fn_skim);
% text(c1(1)+fn(1)*0.2+fn_skim(1)*0.4,c1(2)+fn(2)*0.2+fn_skim(2)*0.4,c1(3)+fn(3)*0.2+fn_skim(3)*0.4,'c1','HorizontalAlignment','left','FontSize',12,'Color','red');  
% text(c2(1)+fn(1)*0.1,c2(2)+fn(2)*0.1,c2(3)+fn(3)*0.1,'c2','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(c3(1)+fn(1)*0.1,c3(2)+fn(2)*0.1,c3(3)+fn(3)*0.1,'c3','HorizontalAlignment','left','FontSize',12,'Color','red');
% line([V1_UP(1),c1(1)],[V1_UP(2),c1(2)],[V1_UP(3),c1(3)],'LineStyle','-','LineWidth',1,'Color','black');
% line([V2_UP(1),c2(1)],[V2_UP(2),c2(2)],[V2_UP(3),c2(3)],'LineStyle','-','LineWidth',1,'Color','black');
% line([V3_UP(1),c3(1)],[V3_UP(2),c3(2)],[V3_UP(3),c3(3)],'LineStyle','-','LineWidth',1,'Color','black');
% 
% line([V1_UP(1),V2_UP(1)],[V1_UP(2),V2_UP(2)],[V1_UP(3),V2_UP(3)],'LineStyle','-','LineWidth',1,'Color','black');
% line([V1_UP(1),V3_UP(1)],[V1_UP(2),V3_UP(2)],[V1_UP(3),V3_UP(3)],'LineStyle','-','LineWidth',1,'Color','black');
% line([V2_UP(1),V3_UP(1)],[V2_UP(2),V3_UP(2)],[V2_UP(3),V3_UP(3)],'LineStyle','-','LineWidth',1,'Color','black');
% line([O1(1),c1(1)],[O1(2),c1(2)],[O1(3),c1(3)],'LineStyle','-','LineWidth',1,'Color','black');
% 
% text(V1_UP(1)+fn(1)*0.1,V1_UP(2)+fn(2)*0.1,V1_UP(3)+fn(3)*0.1,sprintf('$$V_{1}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V1_DOWN(1)+fn(1)*0.1,V1_DOWN(2)+fn(2)*0.1,V1_DOWN(3)+fn(3)*0.1,sprintf('$$V_{1}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V2_UP(1)+fn(1)*0.1,V2_UP(2)+fn(2)*0.1,V2_UP(3)+fn(3)*0.1,sprintf('$$V_{2}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V2_DOWN(1)+fn(1)*0.1,V2_DOWN(2)+fn(2)*0.1,V2_DOWN(3)+fn(3)*0.1,sprintf('$$V_{2}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V3_UP(1)+fn(1)*0.1,V3_UP(2)+fn(2)*0.1,V3_UP(3)+fn(3)*0.1,sprintf('$$V_{3}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% text(V3_DOWN(1)+fn(1)*0.1,V3_DOWN(2)+fn(2)*0.1,V3_DOWN(3)+fn(3)*0.1,sprintf('$$V_{3}^{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12,'Color','red');
% line([V1_UP(1),c1(1)],[V1_UP(2),c1(2)],[V1_UP(3),c1(3)],'LineStyle','--','LineWidth',1,'Color','black');
% line([V1_DOWN(1),c1(1)],[V1_DOWN(2),O1(2)],[V1_DOWN(3),c1(3)],'LineStyle','--','LineWidth',1,'Color','black');
% line([V2_UP(1),c2(1)],[V2_UP(2),c2(2)],[V2_UP(3),c2(3)],'LineStyle','--','LineWidth',1,'Color','black');
% line([V2_DOWN(1),c2(1)],[V2_DOWN(2),c2(2)],[V2_DOWN(3),c2(3)],'LineStyle','--','LineWidth',1,'Color','black');
% line([V3_UP(1),c3(1)],[V3_UP(2),c3(2)],[V3_UP(3),c3(3)],'LineStyle','--','LineWidth',1,'Color','black');
% line([V3_DOWN(1),c3(1)],[V3_DOWN(2),c3(2)],[V2_DOWN(3),c3(3)],'LineStyle','--','LineWidth',1,'Color','black');
hold on;
% quiver3(center(1)+fn(1)*0.4,center(2)+fn(2)*0.4,center(3)+fn(3)*0.4,fn(1),fn(2),fn(3),1,'Color','blue','LineWidth',1,'MaxHeadSize',1);
% quiver3(center(1)+fn(1)*0.4,center(2)+fn(2)*0.4,center(3)+fn(3)*0.4,fn_skim(1),fn_skim(2),fn_skim(3),1,'Color','red','LineWidth',1,'MaxHeadSize',2);
% top=center+fn*1.2;
% skim=center+fn_skim*1.2;
% text(top(1),top(2),top(3),sprintf('$$\\overrightarrow{n}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12);
% text(skim(1)+fn(1)*0.1,skim(2)+fn(2)*0.1,skim(3)+fn(3)*0.1,sprintf('$$\\overrightarrow{t}$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12);
grid off;
hold off;
axis off;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;