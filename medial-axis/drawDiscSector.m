function drawDiscSector(O,r,normal,u,radian,varargin)
%函数的功能：
%函数的描述：
%函数的使用：y=func(input1,input2)
%输入：
%     u:disc法向
%     u:旋转向量
%     radian:征服旋转角
%输出：
%     Y:
%例子：y=func(1,'type1');
%注意事项：利用函数的适用范围。
%文档日期：
%标签：
%创建日期：
%最后更新日期：
%---------------------------------------------------------------------------------------
p = inputParser;            % 函数的输入解析器
addParameter(p,'FaceAlpha',1);      % 设置变量名和默认参数
addParameter(p,'FaceColor','cyan');      % 设置变量名和默认参数
addParameter(p,'EdgeColor','none');      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
%---------------------------------------------------------------------------------------
%% 开始绘制3维圆圈
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