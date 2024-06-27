function [center,r] = calculateCircumcenter(A, B, C, D)
    % �������������������
    % ���룺
    %   A, B, C, D - ��������ĸ����㣬ÿ��������һ����ά�����������
    % �����
    %   center - ��������ĵ�����

    % ����������
    v1 = B - A;
    v2 = C - A;
    v3 = D - A;

    % ���̾���
    M = 2 * [v1; v2; v3];

    % ������
    d = [dot(B, B) - dot(A, A); dot(C, C) - dot(A, A); dot(D, D) - dot(A, A)];

    % �����Է�����
    center = (M \ d).';
    r=norm(A-center);
end