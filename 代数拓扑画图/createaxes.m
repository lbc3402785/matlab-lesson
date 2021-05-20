

axes1 = axes();
hold(axes1,'on');
line([0.0,1.0],[1,1]);
line([1.0,1.0],[0,1]);
line([0.25,0.5],[0,1]);
line([0.5,0.75],[0,1]);
line([0.0,1.0],[0.5,0.5]);
% 创建 scatter
scatter(0.5,1,'DisplayName','a');

% 创建 scatter
scatter(0.75,1,'DisplayName','b');

% 创建 scatter
scatter(0.375,0.5,'DisplayName','a_t');

% 创建 scatter
scatter(0.625,0.5,'DisplayName','b_t');

% 创建 xlabel
xlabel({''});

% 创建 title
title({''},'HorizontalAlignment','center');

% 取消以下行的注释以保留坐标区的 X 范围
 xlim(axes1,[0 2]);
% 取消以下行的注释以保留坐标区的 Y 范围
 ylim(axes1,[0 2]);
box(axes1,'on');
grid(axes1,'on');
% 设置其余坐标区属性
set(axes1,'XTick',[0 0.25 0.5 0.75 1],'YTick',[0 0.5 1]);
text(0.375,0.5,'a_t');
text(0.625,0.5,'b_t');
text(0.125,0.0,'\sigma');
text(0.375,0.0,'\tau');
text(0.625,0.0,'\omega')
