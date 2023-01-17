function drawDiskSegment(O,r,normal,u,radian,varargin)
%---------------------------------------------------------------------------------------
p = inputParser;            % ���������������
addParameter(p,'FaceAlpha',1);      % ���ñ�������Ĭ�ϲ���
addParameter(p,'FaceColor','cyan');      % ���ñ�������Ĭ�ϲ���
addParameter(p,'EdgeColor','none');      % ���ñ�������Ĭ�ϲ���
parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ
%---------------------------------------------------------------------------------------
%% �����Բ��
axis equal;
theta = linspace(-radian, radian, 100);
v=cross(normal,u);
X1=transpose(O(1)+r*u(1)*cos(theta)+r*v(1)*sin(theta));
Y1=transpose(O(2)+r*u(2)*cos(theta)+r*v(2)*sin(theta));
Z1=transpose(O(3)+r*u(3)*cos(theta)+r*v(3)*sin(theta));
center=O+r*cos(radian)*u;
X2=transpose(center(1)+0*cos(theta));
Y2=transpose(center(2)+0*cos(theta));
Z2=transpose(center(3)+0*cos(theta));
N=100;
X=X1;
Y=Y1;
Z=Z1;
for i=1:N
%     line([O(1),x(k)],[O(2),y(k)],[O(3),z(k)],'LineStyle','--','LineWidth',1,'Color','r');
%     hold on;
    XI=X1+(X2-X1)*i/N;
    YI=Y1+(Y2-Y1)*i/N;
    ZI=Z1+(Z2-Z1)*i/N;
    X=cat(2,X,XI);
    Y=cat(2,Y,YI);
    Z=cat(2,Z,ZI);
end

%plot3(x,y,z,'r-', 'LineWidth', 1.3)
h=surf(X,Y,Z);
set(h,'FaceColor',p.Results.FaceColor,'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor',p.Results.EdgeColor);
hold on;
end