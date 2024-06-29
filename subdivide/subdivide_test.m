A0=[1.5, -2];
B0=[2, -1.5];
C0=[1,-1.8];
A=[0, 0];
B=[9, 8];
C=[-2,6];
h1=figure(1);
hAx1 = axes('Parent', h1);
h2=figure(2);
hAx2 = axes('Parent', h2);
points=subdivide(hAx1,hAx2,A0,B0,C0,A,B,C,'A','B','C','O');
t=delaunay(points(:,1),points(:,2));
figure(3);
hold on;
title('Output Triangulation','fontsize',14)
axis equal;
triplot(t,points(:,1),points(:,2),'color','b')%plot della superficie trattata
for i=1:N
    OAi=-AO*i/N;
    Ai=O+OAi;
    OBi=-BO*i/N;
    Bi=O+OBi;
    OCi=-CO*i/N;
    Ci=O+OCi;
    line([Ai(1),Bi(1)],[Ai(2),Bi(2)],'color','cyan','LineStyle','-','LineWidth',2);
    line([Ai(1),Ci(1)],[Ai(2),Ci(2)],'color','cyan','LineStyle','-','LineWidth',2);
    line([Bi(1),Ci(1)],[Bi(2),Ci(2)],'color','cyan','LineStyle','-','LineWidth',2);
end
plot(O(1),O(2),'o','color','red');
text(O(1),O(2),'O','HorizontalAlignment','left','FontSize',12);
plot(A(1),A(2),'o');
plot(B(1),B(2),'o');
plot(C(1),C(2),'o');
text(A(1),A(2),'A','HorizontalAlignment','left','FontSize',12);
text(B(1),B(2),'B','HorizontalAlignment','left','FontSize',12);
text(C(1),C(2),'C','HorizontalAlignment','left','FontSize',12);
line([A0(1),B0(1)],[A0(2),B0(2)],'color','red','LineStyle','-','LineWidth',2);
line([A0(1),C0(1)],[A0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
line([B0(1),C0(1)],[B0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
axis off;
%view(-37.5,30);