function draw3DBoundingBox(x1,y1,z1,x2,y2,z2,varargin)
p = inputParser;            % ���������������
addParameter(p,'Color','black');      % ���ñ�������Ĭ�ϲ���
parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ
if(x1>x2||y1>y2||z1>z2)
    return;
end
%back
line([x1,x2],[y1,y1],[z1,z1],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x2],[y2,y2],[z1,z1],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x1],[y1,y2],[z1,z1],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x2,x2],[y1,y2],[z1,z1],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
%front
line([x1,x2],[y1,y1],[z2,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x2],[y2,y2],[z2,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x1],[y1,y2],[z2,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x2,x2],[y1,y2],[z2,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
%left
line([x1,x1],[y1,y1],[z1,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x1],[y2,y2],[z1,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x1],[y1,y2],[z1,z1],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x1],[y1,y2],[z2,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
%right
line([x2,x2],[y1,y1],[z1,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x2,x2],[y2,y2],[z1,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x2,x2],[y1,y2],[z1,z1],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x2,x2],[y1,y2],[z2,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);

%top
line([x1,x2],[y2,y2],[z1,z1],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x2],[y2,y2],[z2,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x1,x1],[y2,y2],[z1,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
line([x2,x2],[y2,y2],[z1,z2],'LineStyle','--','LineWidth',2,'Color',p.Results.Color);
%bottom
line([x1,x2],[y1,y1],[z1,z1],'LineStyle','--','LineWidth',1,'Color',p.Results.Color);
line([x1,x2],[y1,y1],[z2,z2],'LineStyle','--','LineWidth',1,'Color',p.Results.Color);
line([x1,x1],[y1,y1],[z1,z2],'LineStyle','--','LineWidth',1,'Color',p.Results.Color);
line([x2,x2],[y1,y1],[z1,z2],'LineStyle','--','LineWidth',1,'Color',p.Results.Color);
end