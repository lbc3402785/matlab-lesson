function [smallCenter,base,bigCenter,top]=drawPartMedialCone(c1,c2,r1,r2,L1,R1,L2,R2,cv,axis,radian,m,n,varargin)
%�����Ĺ��ܣ�
%������������
%������ʹ�ã�y=func(input1,input2)
%���룺
%     cv:��ת����
%     axis:��ת��
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
if(~exist('n','var'))
    n = 64;  % ���δ���ָñ������������и�ֵ
end
p = inputParser;            % ���������������
addParameter(p,'mode','face');      % ���ñ�������Ĭ�ϲ���
addParameter(p,'drawSphere',true);      % ���ñ�������Ĭ�ϲ���
addParameter(p,'drawCone',true);      % ���ñ�������Ĭ�ϲ���
addParameter(p,'drawLine',false);      % ���ñ�������Ĭ�ϲ���
addParameter(p,'drawCircle',false);      % ���ñ�������Ĭ�ϲ���
addParameter(p,'FaceAlpha',0.5);      % ���ñ�������Ĭ�ϲ���
parse(p,varargin{:});       % ������������н����������⵽ǰ��ı�������ֵ������±���ȡֵ


if p.Results.drawSphere
    [x1,y1,z1] = sphere(128);
    x1=x1*r1+c1(1);
    y1=y1*r1+c1(2);
    z1=z1*r1+c1(3);
    h1 = surf(x1, y1, z1);
    set(h1,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor','none');%phong
    % set(h1,'FaceColor',[0.807 0.6390 0.6156],'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')

    hold on;
    [x2,y2,z2] = sphere(128);
    x2=x2*r2+c2(1);
    y2=y2*r2+c2(2);
    z2=z2*r2+c2(3);
    h2 = surf(x2, y2, z2);
    set(h2,'FaceColor',[0.88, 0.84, 0.76],'FaceAlpha',p.Results.FaceAlpha,'FaceLighting','gouraud','EdgeColor','none')
    %set(h2,'FaceColor',[0.807 0.6390 0.6156],'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')
    %set(h2, 'FaceColor', [1 0 0])
end
daspect([1 1 1]);

if p.Results.drawCircle
    drawCircle(c1,u1,cv,r1);
    drawCircle(c2,u2,cv,r2);
end
if p.Results.drawLine
    line([c1(1),c2(1)],[c1(2),c2(2)],[c1(3),c2(3)],'LineWidth',2,'Color','magenta');
    line([c1(1),L1(1)],[c1(2),L1(2)],[c1(3),L1(3)],'LineWidth',1);
    line([c1(1),R1(1)],[c1(2),R1(2)],[c1(3),R1(3)],'LineWidth',1);
    line([c2(1),L2(1)],[c2(2),L2(2)],[c2(3),L2(3)],'LineWidth',1);
    line([c2(1),R2(1)],[c2(2),R2(2)],[c2(3),R2(3)],'LineWidth',1);
end

[slabCone]=computeSlabCone(c1,r1,c2,r2);

if p.Results.drawCircle
    [X1,Y1,Z1]=drawCircleSector(slabCone.smallCenter,axis,cv,slabCone.base,180,'Color','cyan');
    [X2,Y2,Z2]=drawCircleSector(slabCone.bigCenter,axis,cv,slabCone.top,180,'Color','cyan');
end
if p.Results.drawCone
    if p.Results.drawCircle==false
        [X1,Y1,Z1]=createCircleSector(slabCone.smallCenter,cv,axis,radian,slabCone.base,m);
        [X2,Y2,Z2]=createCircleSector(slabCone.bigCenter,cv,axis,radian,slabCone.top,m);
    end
    drawCone(X1,Y1,Z1,X2,Y2,Z2,n,'mode',p.Results.mode,'FaceAlpha',p.Results.FaceAlpha);
end
if p.Results.drawLine
    line([L1(1),L2(1)],[L1(2),L2(2)],[L1(3),L2(3)],'LineWidth',2,'Color','m');
    line([R1(1),R2(1)],[R1(2),R2(2)],[R1(3),R2(3)],'LineWidth',2,'Color','m');
end
end