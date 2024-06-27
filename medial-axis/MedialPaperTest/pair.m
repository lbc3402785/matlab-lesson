A = [0, 0, 0];
B = [-0.6, 1, 0.5];
C = [-1, 0, 0];
D = [-0.5, 0.5, -1];

E = [0.4, 1, 0.5];
F = [1, 0, 0];
G = [0.5, 0.5, -1];
tet1=[A; B; C; D];
tet2=[F; E; A; G];
figure('Color', 'white');
hold on;
axis equal;
% 绘制四面体的四个面
patch('Vertices', tet1, 'Faces', [1 2 3; 1 2 4; 2 3 4; 1 3 4], ...
          'FaceColor', rand(1,3), 'FaceAlpha', 0.1);
patch('Vertices', tet2, 'Faces', [1 2 3; 1 2 4; 2 3 4; 1 3 4], ...
          'FaceColor', rand(1,3), 'FaceAlpha', 0.1);
center1=calculateCircumcenter(tet1(1, :), tet1(2, :), tet1(3, :), tet1(4, :));
center2=calculateCircumcenter(tet2(1, :), tet2(2, :), tet2(3, :), tet2(4, :));
plot3(center1(:, 1), center1(:, 2), center1(:, 3), 'ko', 'MarkerSize', 4, 'MarkerFaceColor', 'k');
plot3(center2(:, 1), center2(:, 2), center2(:, 3), 'ko', 'MarkerSize', 4, 'MarkerFaceColor', 'k');

text(A(1),A(2),A(3),'A','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(B(1),B(2),B(3),'B','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(C(1),C(2),C(3),'C','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(D(1),D(2),D(3),'D','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(E(1),E(2),E(3),'E','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(F(1),F(2),F(3),'F','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(G(1),G(2),G(3),'G','Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
text(center1(1),center1(2),center1(3),sprintf('$$O_{%i}$$',1),'Interpreter', 'latex','HorizontalAlignment','right','FontSize',15,'Color','blue');
text(center2(1),center2(2),center2(3),sprintf('$$O_{%i}$$',2),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');

line([center1(1),center2(1)],[center1(2),center2(2)],[center1(3),center2(3)],'LineStyle','-','LineWidth',2,'Color','red');
line([center1(1),A(1)],[center1(2),A(2)],[center1(3),A(3)],'LineStyle','-','LineWidth',2,'Color','red');

line([center2(1),A(1)],[center2(2),A(2)],[center2(3),A(3)],'LineStyle','-','LineWidth',2,'Color','red');
% 设置视图角度
axis off;
axis equal;
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
camlight;