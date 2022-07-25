function [cu,cv,d0,u1,u2,L1,R1,L2,R2,cos_phi,sin_phi]=commonTangent(c1,c2,r1,r2)
    c12=c2-c1;
    d0=[0,1,0];
    cu=c12/norm(c12);
    cos_phi = (r2-r1)/norm(c12);%cos(\phi)/norm(c12)
    d2=sumsqr(c12);
    sin_phi = sqrt(d2-(r2-r1)^2)/norm(c12); %sin(\phi)/norm(c12) <-- 如果 d2<(r2-r1)^2，则无解
    cv=cross(cu,d0);
    cv=cv/norm(cv);
    d0=cross(cv,cu);
    u1=(-cos_phi*cu+sin_phi*d0);
    u2=(-cos_phi*cu-sin_phi*d0);
    L1 = c1+r1*u1; L2 = c2+r2*u1; % 左线切点
    R1 = c1+r1*u2; R2 = c2+r2*u2; % 右线切点
end