c1=[-5,1,0];
c2=[0,3,0];
c3=[0,-3,0];
c4=[5,2,4];

center=(c1+c2+c3)/3;
r1=1;
r2=2;
r3=2;
r4=1.5;

c12=c2-c1;
c13=c3-c1;
fn=cross(c12,c13);
fn=fn/norm(fn);


% [V1_UP,V1_DOWN,O1,A1,B1,V2_UP,V2_DOWN,O2,A2,B2,V3_UP,V3_DOWN,O3,A3,B3]=drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,false,false,false);
drawMedialSlab(c1,c2,c3,r1,r2,r3,180,64,false,false,false);

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