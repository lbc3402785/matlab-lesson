function [X,Y,Z]=drawCircle(c,u,v,r,m,varargin)
if(~exist('m','var'))
    m = 180;  % 如果未出现该变量，则对其进行赋值
end
p = inputParser;            % 函数的输入解析器
addParameter(p,'Color','m');      % 设置变量名和默认参数
addParameter(p,'LineWidth',1);      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
[X,Y,Z]=createCircle(c,u,v,r,m);
plot3(X, Y, Z,'Color',p.Results.Color,'LineWidth',p.Results.LineWidth);
end