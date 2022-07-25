function drawCone(X1,Y1,Z1,X2,Y2,Z2,n,varargin)
if(~exist('n','var'))
    n = 64;  % 如果未出现该变量，则对其进行赋值
end
p = inputParser;            % 函数的输入解析器
addParameter(p,'mode','face');      % 设置变量名和默认参数
addParameter(p,'FaceAlpha',0.5);      % 设置变量名和默认参数
addParameter(p,'Color','cyan');      % 设置变量名和默认参数
addParameter(p,'EdgeColor','none');      % 设置变量名和默认参数
parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
if strcmp(p.Results.mode,'face')==1
    X=X1;
    Y=Y1;
    Z=Z1;
    for i=1:n
        XI=(X2-X1)*i/n+X1;
        YI=(Y2-Y1)*i/n+Y1;
        ZI=(Z2-Z1)*i/n+Z1;
        X=cat(2,X,XI);
        Y=cat(2,Y,YI);
        Z=cat(2,Z,ZI);
    end
    
    h=surf(X,Y,Z);
    set(h,'FaceColor','cyan','FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor',p.Results.EdgeColor)
elseif strcmp(p.Results.mode,'line')==1
    for i=1:size(X1(:,1))
        X=[X1(i),X2(i)];
        Y=[Y1(i),Y2(i)];
        Z=[Z1(i),Z2(i)];
        line(X,Y,Z,'LineWidth',1,'Color',p.Results.Color);
    end
else
    X=reshape(transpose([X1(:,1),X2(:,1)]), 1, []);
    Y=reshape(transpose([Y1(:,1),Y2(:,1)]), 1, []);
    Z=reshape(transpose([Z1(:,1),Z2(:,1)]), 1, []);
    line(X,Y,Z,'LineWidth',1,'Color',p.Results.Color);
end
end