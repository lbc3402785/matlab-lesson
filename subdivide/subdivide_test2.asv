A0=[0, 0];
B0=[0,1];
C0=[-1,0];
[O0,r0]=inscribedCircle(A0,B0,C0);
figure(1);
hold on;
axis equal;
line([A0(1),B0(1)],[A0(2),B0(2)],'color','red','LineStyle','-','LineWidth',1);
line([A0(1),C0(1)],[A0(2),C0(2)],'color','red','LineStyle','-','LineWidth',1);
line([B0(1),C0(1)],[B0(2),C0(2)],'color','red','LineStyle','-','LineWidth',1);
hold on;
a0=norm(B0-C0);
b0=norm(A0-C0);
c0=norm(A0-B0);
delta=min([a0,b0,c0]);
%delta=gcd(round(c0*100),gcd(round(b0*100),round(a0*100)))/10000.0;
A=[0, 0];
B=[0,1];
C=[6,0];
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
% 
N1=round(norm(A-B)/delta);
N2=round(norm(A-C)/delta);
N3=round(norm(B-C)/delta);
N=round(log2(min([N1,N2,N3])))-1;
% disp(N1);
% disp(N2);
% disp(N3);
% multiple=minlength/delta;
% N=round(log2(multiple))-1;
% N=round(log2(minlength/delta))-1;
% N1=round(2^N*norm(A-B)/minlength);
% N2=round(2^N*norm(A-C)/minlength);
% N3=round(2^N*norm(B-C)/minlength);
% disp(N1);
% disp(N2);
% disp(N3);

figure(2);
hold on;
axis equal;
plot(O(1),O(2),'o','color','red');


text(A(1),A(2),'A','HorizontalAlignment','left','FontSize',12);
text(B(1),B(2),'B','HorizontalAlignment','left','FontSize',12);
text(C(1),C(2),'C','HorizontalAlignment','left','FontSize',12);
points=[A;B;C];
for j=1:N1-1
        pij=A*(1-j/N1)+B*(j/N1);
        points=[points;pij];
        plot(pij(1),pij(2),'x');
end
for j=1:N2-1
    pij=A*(1-j/N2)+C*(j/N2);
    points=[points;pij];
    plot(pij(1),pij(2),'x');
end
 for j=1:N3-1
    pij=B*(1-j/N3)+C*(j/N3);
    points=[points;pij];
    plot(pij(1),pij(2),'x');
end
for i=1:N-1
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
    if i<N
        points=[points;Ai;Bi;Ci];
    end
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
t=delaunay(points(:,1),points(:,2));
figure(3);
hold on;
title('Output Triangulation','fontsize',14)
axis equal;
triplot(t,points(:,1),points(:,2),'color','b')%plot della superficie trattata
disp(t);
for i=1:N-1
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
line([A0(1),B0(1)],[A0(2),B0(2)],'color','red','LineStyle','-','LineWidth',2);
line([A0(1),C0(1)],[A0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
line([B0(1),C0(1)],[B0(2),C0(2)],'color','red','LineStyle','-','LineWidth',2);
%view(-37.5,30);
