function [X,Y,Z]=createCircle(c,u,v,r,m)
%函数的功能：
%函数的描述：
%函数的使用：y=func(input1,input2)
%输入：
%     u:旋转向量
%     v:旋转轴
%输出：
%     Y:
%例子：y=func(1,'type1');
%注意事项：利用函数的适用范围。
%文档日期：
%标签：
%创建日期：
%最后更新日期：

th = 0:pi/m:2*pi;
qs=transpose([cos(th/2);sin((th/2))*v(1);sin((th/2))*v(2);sin((th/2))*v(3)]);
P=r*quatrotate(qs,u);
X=P(:,1)+c(1);
Y=P(:,2)+c(2);
Z=P(:,3)+c(3);
end