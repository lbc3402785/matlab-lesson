axes1 = axes();
xlim(axes1,[0,3]);
ylim(axes1,[0,3]);
zlim(axes1,[0,3]);
% 创建 xlabel
xlabel({''});
a=[1,1,1];
b=[2,1,0];
c=[a(1),a(2),0];
scatter3(a(1),a(2),a(3),'DisplayName','A');
scatter3(b(1),b(2),b(3),'DisplayName','B');
scatter3(a(1),a(2),0,'DisplayName','C');

d=b*dot(a,b)/norm(b)^2;
scatter3(d(1),d(2),d(3),'DisplayName','D');
line([0,1],[0,1],[0,1],'Parent',axes1);
line([0,2],[0,1],[0,0],'Parent',axes1);
line([0,1],[0,1],[0,0],'Parent',axes1);
line([1,2],[1,1],[1,0],'Parent',axes1);
line([1,1],[1,1],[1,0],'Parent',axes1,'linestyle','--');
line([1,d(1)],[1,d(2)],[1,d(3)],'Parent',axes1,'linestyle','--');
line([1,d(1)],[1,d(2)],[0,d(3)],'Parent',axes1,'linestyle','--');
text(a(1),a(2),a(3),'A');
text(b(1),b(2),b(3),'B');
text(c(1),c(2),c(3),'C');
text(d(1),d(2),d(3),'D');
text(0.5,0.5,0,'Prj_{OB}{OA}=Prj_{OB}({Prj_{OXY}{OA}})=Prj_{OB}{OC}');
grid(axes1,'on');



