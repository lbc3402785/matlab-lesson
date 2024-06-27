function [center,r] = calculateCircumcenter(A, B, C, D)
    % 计算四面体外接球球心
    % 输入：
    %   A, B, C, D - 四面体的四个顶点，每个顶点是一个三维坐标的行向量
    % 输出：
    %   center - 外接球球心的坐标

    % 构建方程组
    v1 = B - A;
    v2 = C - A;
    v3 = D - A;

    % 方程矩阵
    M = 2 * [v1; v2; v3];

    % 常数项
    d = [dot(B, B) - dot(A, A); dot(C, C) - dot(A, A); dot(D, D) - dot(A, A)];

    % 解线性方程组
    center = (M \ d).';
    r=norm(A-center);
end