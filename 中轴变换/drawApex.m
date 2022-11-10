c0=[0,0,0];
c1=[12,0,0];
u=[0,1,0];
v=[0,0,1];
r0=2;
r1=6;
hold on;
text(c0(1),c0(2),c0(3),'c0','HorizontalAlignment','left','FontSize',10,'Color','red');
text(c1(1),c1(2),c1(3),'c1','HorizontalAlignment','left','FontSize',10,'Color','red');
drawCircle(c0,u,v,r0);
drawCircle(c1,u,v,r1);
line([c0(1),c1(1)],[c0(2),c1(2)],[c0(3),c1(3)],'LineStyle','-','LineWidth',1,'Color','black');
daspect([1 1 1]);
apex = (r1 * c0 - r0 * c1) / (r1 - r0);
line([c0(1),apex(1)],[c0(2),apex(2)],[c0(3),apex(3)],'LineStyle','-','LineWidth',1,'Color','black');
text(apex(1),apex(2),apex(3),'apex','HorizontalAlignment','left','FontSize',10,'Color','red');
if r0<r1
    cv=c1-c0;
else
    cv=c0-c1;
end
cv = cv/norm(cv);
apexc0 = c0 - apex;
vc0len = norm(apexc0);
apexc1 = c1 - apex;
vc1len = norm(apexc1);
cangle = sqrt(1.-r0*r0/vc0len/vc0len);
ct=apex;
if r0 < r1
    apex = apex + apexc0 * cangle * cangle;%small center
    base = r0 * cangle;%small radius
    top = r1 * cangle;%bigger radius
    height = (vc1len - vc0len) * cangle * cangle;
else
    apex = apex + apexc1 * cangle * cangle;
	base = r1 * cangle;
	top = r0 * cangle;
	height = (vc0len - vc1len) * cangle * cangle;
end
p0=apex+base*u;
line([p0(1),apex(1)],[p0(2),apex(2)],[p0(3),apex(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([p0(1),c0(1)],[p0(2),c0(2)],[p0(3),c0(3)],'LineStyle','-','LineWidth',1,'Color','black');
s1=apex+height*cv;
p1=s1+top*u;
text(apex(1),apex(2),apex(3),'s0','HorizontalAlignment','left','FontSize',10,'Color','red');
text(s1(1),s1(2),s1(3),'s1','HorizontalAlignment','left','FontSize',10,'Color','red');
line([ct(1),p1(1)],[ct(2),p1(2)],[ct(3),p1(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([c1(1),p1(1)],[c1(2),p1(2)],[c1(3),p1(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([s1(1),p1(1)],[s1(2),p1(2)],[s1(3),p1(3)],'LineStyle','-','LineWidth',1,'Color','black');
text(p0(1),p0(2),p0(3),'p0','HorizontalAlignment','left','FontSize',10,'Color','red');
text(p1(1),p1(2),p1(3),'p1','HorizontalAlignment','left','FontSize',10,'Color','red');
axis off;
