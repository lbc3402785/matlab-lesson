% 设置参数
numPoints = 10; % 点的数量
xMin = 0; % X轴最小值
xMax = 10; % X轴最大值
yMin = 0; % Y轴最小值
yMax = 10; % Y轴最大值

% 生成均匀分布的点集
x = unifrnd(xMin, xMax, numPoints, 1);
y = unifrnd(yMin, yMax, numPoints, 1);
points = [x, y];

% 计算Voronoi图
[vx, vy] = voronoi(points(:,1), points(:,2));

% 绘制Voronoi图
figure;
plot(points(:,1), points(:,2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % 绘制站点
hold on;
plot(vx, vy, 'b-'); % 绘制Voronoi图
axis equal;
title('Voronoi Diagram');
xlabel('X');
ylabel('Y');
legend('Sites', 'Voronoi Edges');