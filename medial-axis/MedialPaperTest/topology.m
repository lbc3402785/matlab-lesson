% ���嶥��
A = [0, 0, 1.5];
B = [0, 0, -1.5];
scale=2.0;
C = [-sqrt(2), sqrt(2), 0]*scale;
D = [-1, sqrt(3), 0]*scale;
E = [0, 2, 0]*scale;
F = [1, sqrt(3), 0]*scale;
G = [sqrt(3), 1, 0]*scale;
H = [2, 0, 0]*scale;

% ����������Ķ�������
tets = {
    [A; B; C; D],  % ������ ABCD
    [A; B; D; E],  % ������ ABDF
    [A; B; E; F],   % ������ ABEF
    [A; B; F; G],   % ������ ABFG
    [A; B; G; H]   % ������ ABFG
};

% ����������ͼ�������
figure('Color', 'white');
hold on;
axis equal;
contour=[C; D;E;F;G;H];
text(A(1),A(2),A(3),sprintf('$$O_{%i}$$',1),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(B(1),B(2),B(3),sprintf('$$O_{%i}$$',2),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
for i = 1:length(contour)
    ci=contour(i,:);
    text(ci(1),ci(2),ci(3),sprintf('$$A_{%i}$$',i),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
end
centers = zeros(5, 3);  % �洢����
for i = 1:length(tets)
    vertices = tets{i};
    % ������������ĸ���
    patch('Vertices', vertices, 'Faces', [1 2 3; 1 2 4; 2 3 4; 1 3 4], ...
          'FaceColor', rand(1,3), 'FaceAlpha', 0.1);
    % ��������
    centers(i, :) = calculateCircumcenter(vertices(1, :), vertices(2, :), vertices(3, :), vertices(4, :));
    ci=centers(i,:);
    text(ci(1),ci(2),ci(3),sprintf('$$m_{%i}$$',i),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
end

% ��������
plot3(centers(:, 1), centers(:, 2), centers(:, 3), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
for i=1:length(tets)-1
    ci=centers(i,:);
    ci1=centers(i+1,:);
    line([ci(1),ci1(1)],[ci(2),ci1(2)],[ci(3),ci1(3)],'LineStyle','-','LineWidth',2,'Color','red');
end
c1=centers(1,:);
for i=2:length(tets)
    ci=centers(i,:);
    line([c1(1),ci(1)],[c1(2),ci(2)],[c1(3),ci(3)],'LineStyle','-','LineWidth',2,'Color','cyan');
end
% ���ƹ���ı� AB
plot3([A(1) B(1)], [A(2) B(2)], [A(3) B(3)], 'k-', 'LineWidth', 2);

% ������ǩ�ͱ���
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Four Non-overlapping Tetrahedra with Circumcenters');

% ������ͼ�Ƕ�
view(3);
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;