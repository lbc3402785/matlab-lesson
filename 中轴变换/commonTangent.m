function [cu,cv,d0,u1,u2,L1,R1,L2,R2,cos_phi,sin_phi]=commonTangent(c1,c2,r1,r2)
    %函数的功能：
    %函数的描述：
    %函数的使用：y=func(input1,input2)
    %输入：
    %     input1:
    %     input2:
    %输出：
    %     cu: 轴向
    %     cv: 与轴向垂直的某个向量 用来作图
    %     d0: 与轴向垂直的某个向量 用来作图
    %例子：y=func(1,'type1');
    %注意事项：利用函数的适用范围。
    %文档日期：
    %标签：
    %创建日期：
    %最后更新日期：

    c12=c2-c1;
    cos_phi = (r2-r1)/norm(c12);%cos(\phi)/norm(c12)
    d2=sumsqr(c12);
    sin_phi = sqrt(d2-(r2-r1)^2)/norm(c12); %sin(\phi)/norm(c12) <-- 如果 d2<(r2-r1)^2，则无解
    cu=c12/norm(c12);%轴向
    d0=[0,1,0];
    cv=cross(cu,d0);
    if norm(cv)<1e-6
        d0=[0,0,1];
        cv=cross(cu,d0);
    end
    cv=cv/norm(cv);
    if abs(r2-r1)<1e-6
        u1=cv;
        u2=-cv;
        L1 = c1+r1*u1; L2 = c2+r2*u1; % 左线切点
        R1 = c1+r1*u2; R2 = c2+r2*u2; % 右线切点
        return;
    end    
    d0=cross(cv,cu);
    u1=(-cos_phi*cu+sin_phi*d0);
    u2=(-cos_phi*cu-sin_phi*d0);
    L1 = c1+r1*u1; L2 = c2+r2*u1; % 左线切点
    R1 = c1+r1*u2; R2 = c2+r2*u2; % 右线切点
end