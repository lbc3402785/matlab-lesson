addpath(genpath('..'));
addpath(genpath('..\geometry'));
c0=[0,0,0];
c1=[16,0,0];
r0=2;
r1=8;
u=[1,0,0];
v=[0,0,1];
apex=(r1 * c0 - r0 * c1) / (r1 - r0);

drawCircle(c0,u,v,r0);
hold on;
drawCircle(c1,u,v,r1);
text(apex(1),apex(2),apex(3),sprintf('$$apex$$'),'Interpreter', 'latex','HorizontalAlignment','right','FontSize',12);
text(c0(1),c0(2),c0(3),sprintf('$$c_0$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12);
text(c1(1),c1(2),c1(3),sprintf('$$c_1$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12);
line([apex(1),c1(1)],[apex(2),c1(2)],[apex(3),c1(3)],'LineStyle','-','LineWidth',1,'Color','black');
v=c1-c0;
if (r0>r1)
  v=c0-c1;
end
v=v/norm(v);
apexc0 = c0 - apex;
apexc1 = c1 - apex;
vc0len =norm(apexc0);
vc1len =norm(apexc1);
if (r0<r1)
    cangle = sqrt(1.-r1*r1/vc1len/vc1len);
    cosThetaSqr=1.-r1*r1/vc1len/vc1len;
    sinThetaSqr=r1*r1/vc1len/vc1len;
    smallCircleCenter = apex + apexc0 * cangle * cangle;
    base = r0 * cangle;
    top = r1 * cangle;
    height = (vc1len - vc0len) * cangle * cangle;
    bigCircleCenter=smallCircleCenter+height*v;
else
    cangle = sqrt(1.-r0*r0/vc1len/vc1len);
    cosThetaSqr=1.-r0*r0/vc1len/vc1len;
    sinThetaSqr=r0*r0/vc1len/vc1len;
    smallCircleCenter = apex + apexc1 * cangle * cangle;
    base = r0 * cangle;
    top = r1 * cangle;
    height = (vc0len - vc1len) * cangle * cangle;
    bigCircleCenter=smallCircleCenter+height*axis;
end

% cv=[1,0,0];
% if (abs(v(1))>abs(v(2)))
%     cv=[-v(3),0,v(1)];
% else
%     cv=[0,v(3),-v(2)];
% end
cv=[0,1,0];
if(r0<r1)
    L0 = smallCircleCenter+base*cv; 
    L1 = bigCircleCenter+top*cv; % �����е�
    R0 = smallCircleCenter-base*cv; 
    R1 = bigCircleCenter-top*cv; % �����е�
else
    L1 = smallCircleCenter+base*cv; 
    L0 = bigCircleCenter+top*cv; % �����е�
    R1 = smallCircleCenter-base*cv; 
    R0 = bigCircleCenter-top*cv; % �����е�
end
line([L0(1),L1(1)],[L0(2),L1(2)],[L0(3),L1(3)],'LineStyle','-','LineWidth',1,'Color','black');
% line([R0(1),R1(1)],[R0(2),R1(2)],[R0(3),R1(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([apex(1),L1(1)],[apex(2),L1(2)],[apex(3),L1(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([apex(1),R1(1)],[apex(2),R1(2)],[apex(3),R1(3)],'LineStyle','-','LineWidth',1,'Color','black');
text(L0(1),L0(2),L0(3),sprintf('$$L_0$$'),'Interpreter', 'latex','HorizontalAlignment','right','FontSize',12);
text(L1(1),L1(2),L1(3),sprintf('$$L_1$$'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',12);
line([smallCircleCenter(1),L0(1)],[smallCircleCenter(2),L0(2)],[smallCircleCenter(3),L0(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([bigCircleCenter(1),L1(1)],[bigCircleCenter(2),L1(2)],[bigCircleCenter(3),L1(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([c0(1),L0(1)],[c0(2),L0(2)],[c0(3),L0(3)],'LineStyle','-','LineWidth',1,'Color','black');
line([c1(1),L1(1)],[c1(2),L1(2)],[c1(3),L1(3)],'LineStyle','-','LineWidth',1,'Color','black');

% text(smallCircleCenter(1),smallCircleCenter(2),smallCircleCenter(3),sprintf('$$s_0$$'),'Interpreter', 'latex','HorizontalAlignment','right','FontSize',12);
% text(bigCircleCenter(1),bigCircleCenter(2),bigCircleCenter(3),sprintf('$$s_1$$'),'Interpreter', 'latex','HorizontalAlignment','right','FontSize',12);
l=norm(L1-L0);
% p=smallCircleCenter+(L1-L0);
% line([smallCircleCenter(1),p(1)],[smallCircleCenter(2),p(2)],[smallCircleCenter(3),p(3)],'LineStyle','-','LineWidth',1,'Color','black');
% ʹ�� fill3 �������Ʋ������ɫ
% X=[L0(1) c0(1) R0(1) R1(1) c1(1) L1(1)];
% Y=[L0(2) c0(2) R0(2) R1(2) c1(2) L1(2)];
% Z=[L0(3) c0(3) R0(3) R1(3) c1(3) L1(3)];
% fill3(X, Y, Z, 'magenta');
leftV=(L0-c0)/norm(L0-c0);
rightV=(R0-c0)/norm(R0-c0);
p0=L0+leftV*r1;
p1=L1+leftV*r1;

line([p0(1),L0(1)],[p0(2),L0(2)],[p0(3),L0(3)],'LineStyle','--','LineWidth',1,'Color','black');
line([p1(1),L1(1)],[p1(2),L1(2)],[p1(3),L1(3)],'LineStyle','--','LineWidth',1,'Color','black');
q0=R0+rightV*r1;
q1=R1+rightV*r1;

line([q0(1),R0(1)],[q0(2),R0(2)],[q0(3),R0(3)],'LineStyle','--','LineWidth',1,'Color','black');
line([q1(1),R1(1)],[q1(2),R1(2)],[q1(3),R1(3)],'LineStyle','--','LineWidth',1,'Color','black');
seg=Segment(L0,L1);
p=[3,9,0];
[t,fp,dist]=seg.project(p);
line([p(1),fp(1)],[p(2),fp(2)],[p(3),fp(3)],'LineStyle','-','LineWidth',1,'Color','black');
text(p(1),p(2),p(3),sprintf('$$p$$'),'Interpreter', 'latex','HorizontalAlignment','right','Color','red','FontSize',12);
text(fp(1),fp(2),fp(3),sprintf('$$fp$$'),'Interpreter', 'latex','HorizontalAlignment','left','Color','red','FontSize',12);
hold on;
grid off;
hold off;
axis off;
axis equal;
view(0,90);
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;