A0=[1.5, -2];
B0=[2, -1.5];
C0=[1,-1.8];
% <<<<<<< HEAD
[O0,r0]=inscribedCircle(A0,B0,C0);
figure(1);
hold on;
axis equal;
line([A0(1),B0(1)],[A0(2),B0(2)],'color','red','LineStyle','-','LineWidth',1);
line([A0(1),C0(1)],[A0(2),C0(2)],'color','red','LineStyle','-','LineWidth',1);
line([B0(1),C0(1)],[B0(2),C0(2)],'color','red','LineStyle','-','LineWidth',1);
hold on;
% =======
% figure(1);
% hold on;
% axis equal;
% line([A0(1),B0(1)],[A0(2),B0(2)],'color','cyan','LineStyle','-','LineWidth',1);
% line([A0(1),C0(1)],[A0(2),C0(2)],'color','cyan','LineStyle','-','LineWidth',1);
% line([B0(1),C0(1)],[B0(2),C0(2)],'color','cyan','LineStyle','-','LineWidth',1);
% >>>>>>> c21af5105fde9a312e04cd3743a45d9034d9b665
a0=norm(B0-C0);
b0=norm(A0-C0);
c0=norm(A0-B0);
delta=min([a0,b0,c0]);
%delta=gcd(round(c0*100),gcd(round(b0*100),round(a0*100)))/10000.0;
A=[0, 0];
B=[9, 8];
C=[-2,6];
[O,r]=inscribedCircle(A,B,C);
circle(O(1),O(2),r);
line([A(1),B(1)],[A(2),B(2)],'color','red','LineStyle','-','LineWidth',1);
line([A(1),C(1)],[A(2),C(2)],'color','red','LineStyle','-','LineWidth',1);
line([B(1),C(1)],[B(2),C(2)],'color','red','LineStyle','-','LineWidth',1);
BO=O-B;
OD=r*BO/norm(BO);
D=O+OD;
text(D(1),D(2),'D','HorizontalAlignment','left','FontSize',12);
line([D(1),O(1)],[D(2),O(2)],'LineStyle','-','color','red','LineWidth',1);
CO=O-C;
OE=r*CO/norm(CO);
E=O+OE;
text(E(1),E(2),'E','HorizontalAlignment','left','FontSize',12);
line([E(1),O(1)],[E(2),O(2)],'LineStyle','-','color','red','LineWidth',1);
AO=O-A;
OF=r*AO/norm(AO);
F=O+OF;
text(F(1),F(2),'F','HorizontalAlignment','left','FontSize',12);
line([F(1),O(1)],[F(2),O(2)],'LineStyle','-','color','red','LineWidth',1);
points=[];
minlength=min([norm(A-B),norm(A-C),norm(B-C)]);
maxlength=max([norm(A-B),norm(A-C),norm(B-C)]);
% 
N1=round(norm(A-B)/delta);
N2=round(norm(A-C)/delta);
N3=round(norm(B-C)/delta);
N=round(log2(min([N1,N2,N3])))-1;
% multiple=r/r0;
% N=round(log2(multiple))-1;

figure(2);
hold on;
title('Output Points','fontsize',14)
axis equal;
plot(O(1),O(2),'o','color','red');
% <<<<<<< HEAD

% =======
text(O(1),O(2),'O','HorizontalAlignment','left','FontSize',12);
r1=(norm(A-B)/maxlength);
r2=(norm(A-C)/maxlength);
r3=(norm(B-C)/maxlength);
% >>>>>>> c21af5105fde9a312e04cd3743a45d9034d9b665

text(A(1),A(2),'A','HorizontalAlignment','left','FontSize',12);
text(B(1),B(2),'B','HorizontalAlignment','left','FontSize',12);
text(C(1),C(2),'C','HorizontalAlignment','left','FontSize',12);
for i=1:N
    OAi=-AO*i/N;
    Ai=O+OAi;
    OBi=-BO*i/N;
    Bi=O+OBi;
    OCi=-CO*i/N;
    Ci=O+OCi;
    plot(Ai(1),Ai(2),'x');
    plot(Bi(1),Bi(2),'x');
    plot(Ci(1),Ci(2),'x');
    line([Ai(1),Bi(1)],[Ai(2),Bi(2)],'color','cyan','LineStyle','-','LineWidth',1);
    line([Ai(1),Ci(1)],[Ai(2),Ci(2)],'color','cyan','LineStyle','-','LineWidth',1);
    line([Bi(1),Ci(1)],[Bi(2),Ci(2)],'color','cyan','LineStyle','-','LineWidth',1);
    points=[points;Ai;Bi;Ci];
    MI=2^(N-i);
    k1=fix(N1/MI);
    k2=fix(N2/MI);
    k3=fix(N3/MI);
    for j=1:k1-1
        pij=Ai*(1-j/k1)+Bi*(j/k1);
        points=[points;pij];
        plot(pij(1),pij(2),'x');
    end
    for j=1:k2-1
        pij=Ai*(1-j/k2)+Ci*(j/k2);
        points=[points;pij];
        plot(pij(1),pij(2),'x');
    end
     for j=1:k3-1
        pij=Bi*(1-j/k3)+Ci*(j/k3);
        points=[points;pij];
        plot(pij(1),pij(2),'x');
    end
end
plot(A(1),A(2),'o');
plot(B(1),B(2),'o');
plot(C(1),C(2),'o');
line([A0(1),B0(1)],[A0(2),B0(2)],'color','red','LineStyle','-','LineWidth',2);
line([A0(1),C0(1)],[A0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
line([B0(1),C0(1)],[B0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
axis off;
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