function [X,Y,Z]=createCircle(c,u,v,r,m)
%�����Ĺ��ܣ�
%������������
%������ʹ�ã�y=func(input1,input2)
%���룺
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

th = 0:pi/m:2*pi;
qs=transpose([cos(th/2);sin((th/2))*v(1);sin((th/2))*v(2);sin((th/2))*v(3)]);
P=r*quatrotate(qs,u);
X=P(:,1)+c(1);
Y=P(:,2)+c(2);
Z=P(:,3)+c(3);
end