function [points]=subdivide(hAx1,hAx2,A0,B0,C0,A,B,C,strA,strB,strC,strO)
points=[];
%inscribed circle of small triangle
[O0,r0]=inscribedCircle(A0,B0,C0);
%========figure 1========

hold on;
axis equal;
line(hAx1,[A0(1),B0(1)],[A0(2),B0(2)],'color','red','LineStyle','-','LineWidth',1);
line(hAx1,[A0(1),C0(1)],[A0(2),C0(2)],'color','red','LineStyle','-','LineWidth',1);
line(hAx1,[B0(1),C0(1)],[B0(2),C0(2)],'color','red','LineStyle','-','LineWidth',1);
hold on;

a0=norm(B0-C0);
b0=norm(A0-C0);
c0=norm(A0-B0);
delta=min([a0,b0,c0]);
%inscribed circle of big triangle
[O,r]=inscribedCircle(A,B,C);
circle(hAx1,O(1),O(2),r);
line(hAx1,[A(1),B(1)],[A(2),B(2)],'color','red','LineStyle','-','LineWidth',1);
line(hAx1,[A(1),C(1)],[A(2),C(2)],'color','red','LineStyle','-','LineWidth',1);
line(hAx1,[B(1),C(1)],[B(2),C(2)],'color','red','LineStyle','-','LineWidth',1);
%The feet of the perpendiculars from the incenter of a triangle to its three sides.
BO=O-B;
OD=r*BO/norm(BO);
D=O+OD;
text(hAx1,D(1),D(2),'D','HorizontalAlignment','left','FontSize',12);
line(hAx1,[D(1),O(1)],[D(2),O(2)],'LineStyle','-','color','red','LineWidth',1);
CO=O-C;
OE=r*CO/norm(CO);
E=O+OE;
text(hAx1,E(1),E(2),'E','HorizontalAlignment','left','FontSize',12);
line(hAx1,[E(1),O(1)],[E(2),O(2)],'LineStyle','-','color','red','LineWidth',1);
AO=O-A;
OF=r*AO/norm(AO);
F=O+OF;
text(hAx1,F(1),F(2),'F','HorizontalAlignment','left','FontSize',12);
line(hAx1,[F(1),O(1)],[F(2),O(2)],'LineStyle','-','color','red','LineWidth',1);

minlength=min([norm(A-B),norm(A-C),norm(B-C)]);
maxlength=max([norm(A-B),norm(A-C),norm(B-C)]);
% 
N1=round(norm(A-B)/delta);
N2=round(norm(A-C)/delta);
N3=round(norm(B-C)/delta);
N=round(log2(min([N1,N2,N3])))-1;
% multiple=r/r0;
% N=round(log2(multiple))-1;
%========figure 2========

hold on;
title('Output Points','fontsize',14)
axis equal;
plot(hAx2,O(1),O(2),'o','color','red');
text(hAx2,O(1),O(2),strO,'HorizontalAlignment','left','FontSize',12);
text(hAx2,A(1),A(2),strA,'HorizontalAlignment','left','FontSize',12);
text(hAx2,B(1),B(2),strB,'HorizontalAlignment','left','FontSize',12);
text(hAx2,C(1),C(2),strC,'HorizontalAlignment','left','FontSize',12);
for i=1:N
    OAi=-AO*i/N;
    Ai=O+OAi;
    OBi=-BO*i/N;
    Bi=O+OBi;
    OCi=-CO*i/N;
    Ci=O+OCi;
    plot(hAx2,Ai(1),Ai(2),'x');
    plot(hAx2,Bi(1),Bi(2),'x');
    plot(hAx2,Ci(1),Ci(2),'x');
    line(hAx2,[Ai(1),Bi(1)],[Ai(2),Bi(2)],'color','cyan','LineStyle','-','LineWidth',1);
    line(hAx2,[Ai(1),Ci(1)],[Ai(2),Ci(2)],'color','cyan','LineStyle','-','LineWidth',1);
    line(hAx2,[Bi(1),Ci(1)],[Bi(2),Ci(2)],'color','cyan','LineStyle','-','LineWidth',1);
    points=[points;Ai;Bi;Ci];
    MI=2^(N-i);
    k1=fix(N1/MI);
    k2=fix(N2/MI);
    k3=fix(N3/MI);
    for j=1:k1-1
        pij=Ai*(1-j/k1)+Bi*(j/k1);
        points=[points;pij];
        plot(hAx2,pij(1),pij(2),'x');
    end
    for j=1:k2-1
        pij=Ai*(1-j/k2)+Ci*(j/k2);
        points=[points;pij];
        plot(hAx2,pij(1),pij(2),'x');
    end
     for j=1:k3-1
        pij=Bi*(1-j/k3)+Ci*(j/k3);
        points=[points;pij];
        plot(pij(1),pij(2),'x');
    end
end
plot(hAx2,A(1),A(2),'o');
plot(hAx2,B(1),B(2),'o');
plot(hAx2,C(1),C(2),'o');
line(hAx2,[A0(1),B0(1)],[A0(2),B0(2)],'color','red','LineStyle','-','LineWidth',2);
line(hAx2,[A0(1),C0(1)],[A0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
line(hAx2,[B0(1),C0(1)],[B0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
axis off;
end
