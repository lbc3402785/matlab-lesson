A0 = [5.5, -6];
B0 = [8, -4.5];
C0 = [5, -4.8];
A = [-2, -2];
B = [5, -4.8];
C = [12, -1];
D=[8, -4.5];
E=[1, -8];
F=[10, -9];
G=[5.5, -6];

h1 = figure(1);
hAx1 = axes('Parent', h1);

h2 = figure(2);
hAx2 = axes('Parent', h2);

h3 = figure(3);
hAx3 = axes('Parent', h3);

points1 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, A, B, C, 'A', 'B', 'C', '$O_{1}$');
points2 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, C, B, D, 'C', 'B', 'D', '$O_{2}$');
points3 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, A, E, B, 'A', 'E', 'B', '$O_{3}$');
points4 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, C, D, F, 'C', 'D', 'F', '$O_{4}$');
points5 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, F, D, G, 'F', 'D', 'G', '$O_{5}$');
points6 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, B, E, G, 'B', 'E', 'G', '$O_{6}$');
points7 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, E, F, G, 'E', 'F', 'G', '$O_{7}$');
points8 = subdivide(hAx1, hAx2, hAx3, A0, B0, C0, B, G, D, 'B', 'G', 'D', '$O_{8}$');
hold(hAx3, 'on');
line(hAx3, [A0(1), B0(1)], [A0(2), B0(2)], 'color', 'red', 'LineStyle', '-', 'LineWidth', 2);
line(hAx3, [A0(1), C0(1)], [A0(2), C0(2)], 'color', 'red', 'LineStyle', '-', 'LineWidth', 2);
line(hAx3, [B0(1), C0(1)], [B0(2), C0(2)], 'color', 'red', 'LineStyle', '-', 'LineWidth', 2);
hold(hAx3, 'off');