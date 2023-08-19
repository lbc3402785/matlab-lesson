% ���ò���
numPoints = 10; % �������
xMin = 0; % X����Сֵ
xMax = 10; % X�����ֵ
yMin = 0; % Y����Сֵ
yMax = 10; % Y�����ֵ

% ���ɾ��ȷֲ��ĵ㼯
x = unifrnd(xMin, xMax, numPoints, 1);
y = unifrnd(yMin, yMax, numPoints, 1);
points = [x, y];

% ����Voronoiͼ
[vx, vy] = voronoi(points(:,1), points(:,2));

% ����Voronoiͼ
figure;
plot(points(:,1), points(:,2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % ����վ��
hold on;
plot(vx, vy, 'b-'); % ����Voronoiͼ
axis equal;
title('Voronoi Diagram');
xlabel('X');
ylabel('Y');
legend('Sites', 'Voronoi Edges');