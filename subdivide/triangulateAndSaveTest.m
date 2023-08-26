% 输入一组点
points = [1.0, 2.0; 2.0, 3.0; 3.0, 1.0; 4.0, 2.0; 3.0, 4.0; 2.0, 1.0];

% 调用函数进行三角化并保存为OBJ模型
triangulateAndSave(points, 'triangulated.obj');