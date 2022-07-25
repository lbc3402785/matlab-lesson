function [X,Y,Z]=drawCircle(c,u,v,r,m,varargin)
if(~exist('m','var'))
    m = 180;  % ���δ���ָñ������������и�ֵ
end
p = inputParser;            % ���������������
addParameter(p,'Color','m');      % ���ñ�������Ĭ�ϲ���
addParameter(p,'LineWidth',1);      % ���ñ�������Ĭ�ϲ���
parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ
[X,Y,Z]=createCircle(c,u,v,r,m);
plot3(X, Y, Z,'Color',p.Results.Color,'LineWidth',p.Results.LineWidth);
end