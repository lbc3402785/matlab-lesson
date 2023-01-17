function drawDiscSector(O,r,normal,u,radian,varargin)
%�����Ĺ��ܣ�
%������������
%������ʹ�ã�y=func(input1,input2)
%���룺
%     u:disc����
%     u:��ת����
%     radian:������ת��
%�����
%     Y:
%���ӣ�y=func(1,'type1');
%ע��������ú��������÷�Χ��
%�ĵ����ڣ�
%��ǩ��
%�������ڣ�
%���������ڣ�
%---------------------------------------------------------------------------------------
p = inputParser;            % ���������������
addParameter(p,'FaceAlpha',1);      % ���ñ�������Ĭ�ϲ���
addParameter(p,'FaceColor','cyan');      % ���ñ�������Ĭ�ϲ���
addParameter(p,'EdgeColor','none');      % ���ñ�������Ĭ�ϲ���
parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ
%---------------------------------------------------------------------------------------
%% ��ʼ����3άԲȦ
axis equal;
theta = linspace(-radian, radian, 100);
v=cross(normal,u);
X=transpose(O(1)+r*u(1)*cos(theta)+r*v(1)*sin(theta));
Y=transpose(O(2)+r*u(2)*cos(theta)+r*v(2)*sin(theta));
Z=transpose(O(3)+r*u(3)*cos(theta)+r*v(3)*sin(theta));
N=100;
for i=1:N
%     line([O(1),x(k)],[O(2),y(k)],[O(3),z(k)],'LineStyle','--','LineWidth',1,'Color','r');
%     hold on;
    ri=r*(1.0-i/N);
    XI=transpose(O(1)+ri*u(1)*cos(theta)+ri*v(1)*sin(theta));
    YI=transpose(O(2)+ri*u(2)*cos(theta)+ri*v(2)*sin(theta));
    ZI=transpose(O(3)+ri*u(3)*cos(theta)+ri*v(3)*sin(theta));
    X=cat(2,X,XI);
    Y=cat(2,Y,YI);
    Z=cat(2,Z,ZI);
end

%plot3(x,y,z,'r-', 'LineWidth', 1.3)
h=surf(X,Y,Z);
set(h,'FaceColor',p.Results.FaceColor,'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor',p.Results.EdgeColor);
hold on;
end