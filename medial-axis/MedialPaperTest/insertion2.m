A = [0.5, 0, 0];
B = [-0.1, 1, 0.5];
C = [-0.5, 0, 0];
D = [0, 0.5, -1];
tet=[A; B; C; D];
E = [-0.8, 0.5, -1];
F = [0.8, 0.5, -1];
figure('Color', 'white');
hold on;
axis equal;
% 绘制四面体的四个面
patch('Vertices', tet, 'Faces', [1 2 3; 1 2 4; 2 3 4; 1 3 4], ...
          'FaceColor', rand(1,3), 'FaceAlpha', 0.1, 'EdgeColor', 'none');
center=calculateCircumcenter(tet(1, :), tet(2, :), tet(3, :), tet(4, :));
plot3([B(1), D(1)], [B(2), D(2)], [B(3), D(3)], 'k--', 'LineWidth', 1.5); % 虚线
plot3([C(1), D(1)], [C(2), D(2)], [C(3), D(3)], 'k--', 'LineWidth', 1.5); % 虚线
plot3([A(1), D(1)], [A(2), D(2)], [A(3), D(3)], 'k--', 'LineWidth', 1.5); % 虚线
plot3([B(1), C(1)], [B(2), C(2)], [B(3), C(3)], 'k-', 'LineWidth', 1.5); % 实线
plot3([B(1), A(1)], [B(2), A(2)], [B(3), A(3)], 'k-', 'LineWidth', 1.5); % 实线
plot3([C(1), A(1)], [C(2), A(2)], [C(3), A(3)], 'k-', 'LineWidth', 1.5); % 实线
plot3(center(:, 1), center(:, 2), center(:, 3), 'ko', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
line([D(1),E(1)],[D(2),E(2)],[D(3),E(3)],'LineStyle','--','LineWidth',1,'Color','blue');
line([D(1),F(1)],[D(2),F(2)],[D(3),F(3)],'LineStyle','--','LineWidth',1,'Color','blue');
line([C(1),E(1)],[C(2),E(2)],[C(3),E(3)],'LineStyle','--','LineWidth',1,'Color','blue');
line([A(1),F(1)],[A(2),F(2)],[A(3),F(3)],'LineStyle','--','LineWidth',1,'Color','blue');

text(A(1),A(2),A(3),'A','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(B(1),B(2),B(3),'B','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(C(1),C(2),C(3),'C','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(D(1),D(2),D(3),'D','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(center(1),center(2),center(3),'O','Interpreter', 'latex','HorizontalAlignment','right','FontSize',15,'Color','blue');

line([center(1),C(1)],[center(2),C(2)],[center(3),C(3)],'LineStyle','-','LineWidth',2,'Color','red');
line([center(1),A(1)],[center(2),A(2)],[center(3),A(3)],'LineStyle','-','LineWidth',2,'Color','red');

% 设置视图角度
view([1, 0]);
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;
% title('动态绕Y轴旋转的3D图');
% 
% for theta = 0:360
%     new_azimuth = sind(theta) * 90;
%     new_elevation = cosd(theta) * 90;
%     view([new_azimuth, new_elevation]);
%     pause(0.1);
% end