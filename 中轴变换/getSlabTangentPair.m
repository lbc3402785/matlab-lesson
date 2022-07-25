function [V1_UP,V1_DOWN,O,A,B]=getSlabTangentPair(c1,r1,c12,c13,cos_phi_12,cos_phi_13,varargin)
p = inputParser;            % 函数的输入解析器
addParameter(p,'drawLine',false);      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值

n12=c12/norm(c12);
A=c1+c12/norm(c12)*cos_phi_12*r1;
B=c1+c13/norm(c13)*cos_phi_13*r1;
AB=B-A;
fn=cross(c12,c13);
fn=fn/norm(fn);
if p.Results.drawLine
    text(A(1)+fn(1)*0.1,A(2)+fn(2)*0.1,A(3)+fn(3)*0.1,'A','HorizontalAlignment','left','FontSize',12);
    text(B(1)+fn(1)*0.1,B(2)+fn(2)*0.1,B(3)+fn(3)*0.1,'B','HorizontalAlignment','left','FontSize',12);
    line([c1(1),A(1)],[c1(2),A(2)],[c1(3),A(3)],'LineStyle','-','LineWidth',1,'Color','black');
    line([c1(1),B(1)],[c1(2),B(2)],[c1(3),B(3)],'LineStyle','-','LineWidth',1,'Color','black');
end

q=[cos(pi/4),-sin(pi/4)*n12(1),-sin(pi/4)*n12(2),-sin(pi/4)*n12(3)];
fn12=quatrotate(q,fn);
fn12=fn12/norm(fn12);
O=A+dot(AB,c13)*fn12/dot(fn12,c13);
c1_O=O-c1;
if p.Results.drawLine
    line([O(1),A(1)],[O(2),A(2)],[O(3),A(3)],'LineStyle','--','LineWidth',1,'Color','black');
    line([O(1),B(1)],[O(2),B(2)],[O(3),B(3)],'LineStyle','--','LineWidth',1,'Color','black');
    text(O(1)+fn(1)*0.1,O(2)+fn(2)*0.1,O(3)+fn(3)*0.1,'O','HorizontalAlignment','left','FontSize',12);
end
h=sqrt(r1*r1-dot(c1_O,c1_O));
V1_UP=O+h*fn;
V1_DOWN=O-h*fn;
if p.Results.drawLine
    n13=B-O;
    n13=n13/norm(n13);
    length=dot(A-O,-n13);
    h=O-length*n13;
    text(h(1)+fn(1)*0.1,h(2)+fn(2)*0.1,h(3)+fn(3)*0.1,'h','HorizontalAlignment','left','FontSize',12);
    line([h(1),O(1)],[h(2),O(2)],[h(3),O(3)],'LineStyle','--','LineWidth',1,'Color','red');
    line([h(1),A(1)],[h(2),A(2)],[h(3),A(3)],'LineStyle','--','LineWidth',1,'Color','red');
    line([h(1),V1_UP(1)],[h(2),V1_UP(2)],[h(3),V1_UP(3)],'LineStyle','--','LineWidth',1,'Color','red');
end
end