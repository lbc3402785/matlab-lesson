function [X,Y,Z]=drawCircleSector(c,u,v,radian,r,m,varargin)
%�����Ĺ��ܣ�
%������������
%������ʹ�ã�y=func(input1,input2)
%���룺
%     c:��ת����
%     u:��ת����
%     v:��ת��
%�����
%     Y:
%���ӣ�y=func(1,'type1');
%ע��������ú��������÷�Χ��
%�ĵ����ڣ�
%��ǩ��
%�������ڣ�
%���������ڣ�
%--------------------------------
if(~exist('m','var'))
    m = 180;  % ���δ���ָñ������������и�ֵ
end
p = inputParser;            % ���������������
addParameter(p,'Color','m');      % ���ñ�������Ĭ�ϲ���
addParameter(p,'LineWidth',1);      % ���ñ�������Ĭ�ϲ���
parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ
[X,Y,Z]=createCircleSector(c,u,v,radian,r,m);
plot3(X, Y, Z,'Color',p.Results.Color,'LineWidth',p.Results.LineWidth);
end