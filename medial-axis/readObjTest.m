% 添加import_obj工具箱的路径
addpath(genpath('..\..\readObj\'));
addpath(genpath('..'));
addpath(genpath('..\geometry'));


% 读取OBJ文件
obj = readObj('E:\matlab-lesson\data\tri.obj');

% 获取顶点坐标和面索引
vertices = obj.v;
faces = obj.f.v;
% 计算顶点坐标的最小值和最大值
xmin = min(vertices(:, 1));
xmax = max(vertices(:, 1));
ymin = min(vertices(:, 2));
ymax = max(vertices(:, 2));
zmin = min(vertices(:, 3));
zmax = max(vertices(:, 3));

% 输出结果
disp(['xmin: ', num2str(xmin)]);
disp(['xmax: ', num2str(xmax)]);
disp(['ymin: ', num2str(ymin)]);
disp(['ymax: ', num2str(ymax)]);
disp(['zmin: ', num2str(zmin)]);
disp(['zmax: ', num2str(zmax)]);
% disp(['vertices:',num2str(size(vertices))]);
% disp(['faces:',num2str(size(faces))]);
% 遍历faces
for i = 1:size(faces, 1)
    % 获取当前面的顶点索引
    faceVerticesIndexes = faces(i, :);
    
    % 输出当前面的顶点索引
%     disp(['第', num2str(i), '个面的顶点索引：']);
%     disp(faceVerticesIndexes);
    
    % 遍历当前面的顶点索引
%     for j = 1:length(faceVertices)
%         % 获取当前顶点索引对应的顶点坐标
%         vertexIndex = faceVertices(j);
%         vertex = vertices(vertexIndex, :);
%         
%         % 输出当前顶点坐标
%         disp(['顶点', num2str(vertexIndex), '的坐标：']);
%         disp(vertex);
%     end
    faceVertices=vertices(faceVerticesIndexes,:);
    tri=Triangle(faceVertices(1,:),faceVertices(2,:),faceVertices(3,:));
    tri.draw();
    hold on;
    disp('-------------------');
end
axis([xmin, xmax, ymin, ymax, zmin, zmax]);
grid off;
hold off;
axis off;
axis equal;
% light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
% camlight;
set(gcf, 'Renderer', 'opengl')