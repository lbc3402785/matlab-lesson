A=[0 0];
B=[3 0];
C=[1.5,1.5*sqrt(3)];
O=(A+B+C)/3;
% [center,r]=inscribedCircle(A,B,C);
% 
% circle(center(1),center(2),r);
line([A(1),B(1)],[A(2),B(2)],'LineStyle','-','LineWidth',1);
line([A(1),C(1)],[A(2),C(2)],'LineStyle','-','LineWidth',1);
line([B(1),C(1)],[B(2),C(2)],'LineStyle','-','LineWidth',1);
% line([A(1),center(1)],[A(2),center(2)],'LineStyle','--','LineWidth',1);
% line([B(1),center(1)],[B(2),center(2)],'LineStyle','--','LineWidth',1);
% line([C(1),center(1)],[C(2),center(2)],'LineStyle','--','LineWidth',1);
text(A(1),A(2),'A','HorizontalAlignment','left','FontSize',12);
text(B(1),B(2),'B','HorizontalAlignment','left','FontSize',12);
text(C(1),C(2),'C','HorizontalAlignment','left','FontSize',12);
text(O(1),O(2),'O','HorizontalAlignment','left','FontSize',12);
line([A(1),O(1)],[A(2),O(2)],'LineStyle','-','LineWidth',1);
line([B(1),O(1)],[B(2),O(2)],'LineStyle','-','LineWidth',1);
line([C(1),O(1)],[C(2),O(2)],'LineStyle','-','LineWidth',1);
CO=O-C;

CA=A-C;
CA=CA/norm(CA);
D=dot(CO,CA)*CA+C;
text(D(1),D(2),'D','HorizontalAlignment','left','FontSize',12);
line([D(1),O(1)],[D(2),O(2)],'LineStyle','--','LineWidth',1);
axis equal;
[center,r]=circumCircle(C,D,O);
circle(center(1),center(2),r);
E=(C+D+O)/3;
[center,r]=circumCircle(C,E,O);
text(E(1),E(2),'E','HorizontalAlignment','left','FontSize',12);
line([C(1),E(1)],[C(2),E(2)],'LineStyle','-','LineWidth',1);
line([A(1),E(1)],[A(2),E(2)],'LineStyle','-','LineWidth',1);
line([O(1),E(1)],[O(2),E(2)],'LineStyle','-','LineWidth',1);
circle(center(1),center(2),r);
CB=B-C;
CB=CB/norm(CB);
F=dot(CO,CB)*CB+C;
text(F(1),F(2),'F','HorizontalAlignment','left','FontSize',12);
line([F(1),O(1)],[F(2),O(2)],'LineStyle','--','LineWidth',1);
hold off;
figure(2);
hold on;
text(A(1),A(2),'A','HorizontalAlignment','left','FontSize',12);
text(B(1),B(2),'B','HorizontalAlignment','left','FontSize',12);
text(C(1),C(2),'C','HorizontalAlignment','left','FontSize',12);
text(O(1),O(2),'O','HorizontalAlignment','left','FontSize',12);
line([A(1),B(1)],[A(2),B(2)],'LineStyle','-','LineWidth',1);
line([A(1),C(1)],[A(2),C(2)],'LineStyle','-','LineWidth',1);
line([B(1),C(1)],[B(2),C(2)],'LineStyle','-','LineWidth',1);
line([A(1),O(1)],[A(2),O(2)],'LineStyle','-','LineWidth',1);
line([B(1),O(1)],[B(2),O(2)],'LineStyle','-','LineWidth',1);
line([C(1),O(1)],[C(2),O(2)],'LineStyle','-','LineWidth',1);
E=(A+O+D)/3;
text(E(1),E(2),'E','HorizontalAlignment','left','FontSize',12);
line([C(1),E(1)],[C(2),E(2)],'LineStyle','-','LineWidth',1);
line([A(1),E(1)],[A(2),E(2)],'LineStyle','-','LineWidth',1);
line([O(1),E(1)],[O(2),E(2)],'LineStyle','-','LineWidth',1);
text(D(1),D(2),'D','HorizontalAlignment','left','FontSize',12);
line([D(1),O(1)],[D(2),O(2)],'LineStyle','--','LineWidth',1);
text(F(1),F(2),'F','HorizontalAlignment','left','FontSize',12);
line([F(1),O(1)],[F(2),O(2)],'LineStyle','--','LineWidth',1);
[center,r]=circumCircle(C,E,O);
circle(center(1),center(2),r);
axis equal;