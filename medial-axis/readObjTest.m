% ���import_obj�������·��
addpath(genpath('..\..\readObj\'));
addpath(genpath('..'));
addpath(genpath('..\geometry'));


% ��ȡOBJ�ļ�
obj = readObj('E:\matlab-lesson\data\tri.obj');

% ��ȡ���������������
vertices = obj.v;
faces = obj.f.v;
% ���㶥���������Сֵ�����ֵ
xmin = min(vertices(:, 1));
xmax = max(vertices(:, 1));
ymin = min(vertices(:, 2));
ymax = max(vertices(:, 2));
zmin = min(vertices(:, 3));
zmax = max(vertices(:, 3));

% ������
disp(['xmin: ', num2str(xmin)]);
disp(['xmax: ', num2str(xmax)]);
disp(['ymin: ', num2str(ymin)]);
disp(['ymax: ', num2str(ymax)]);
disp(['zmin: ', num2str(zmin)]);
disp(['zmax: ', num2str(zmax)]);
% disp(['vertices:',num2str(size(vertices))]);
% disp(['faces:',num2str(size(faces))]);
% ����faces
for i = 1:size(faces, 1)
    % ��ȡ��ǰ��Ķ�������
    faceVerticesIndexes = faces(i, :);
    
    % �����ǰ��Ķ�������
%     disp(['��', num2str(i), '����Ķ���������']);
%     disp(faceVerticesIndexes);
    
    % ������ǰ��Ķ�������
%     for j = 1:length(faceVertices)
%         % ��ȡ��ǰ����������Ӧ�Ķ�������
%         vertexIndex = faceVertices(j);
%         vertex = vertices(vertexIndex, :);
%         
%         % �����ǰ��������
%         disp(['����', num2str(vertexIndex), '�����꣺']);
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