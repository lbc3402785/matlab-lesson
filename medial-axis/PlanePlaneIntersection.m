function [p]=PlanePlaneIntersection(n,n1,d1,n2,d2)
    if(abs(n(1))>1e-5)
        %b1y0+c1z0=d1
        %b2y0+c2z0=d2
        y0=(d1*n2(3)-d2*n1(3))/(n1(2)*n2(3)-n1(3)*n2(2));
        z0=(d2*n1(2)-d1*n2(2))/(n1(2)*n2(3)-n1(3)*n2(2));
        p=[0,y0,z0];
    elseif (abs(n(2))>1e-5)
        %a1x0+c1z0=d1
        %a2x0+c2z0=d2
        x0=(d1*n2(3)-d2*n1(3))/(n1(1)*n2(3)-n1(3)*n2(1));
        z0=(d2*n1(1)-d1*n2(1))/(n1(1)*n2(3)-n1(3)*n2(1));
        p=[x0,0,z0];
    else
        %a1x0+b1y0=d1
        %a2x0+b2y0=d2
        x0=(d1*n2(2)-d2*n1(2))/(n1(1)*n2(2)-n1(2)*n2(1));
        y0=(d2*n1(1)-d1*n2(1))/(n1(1)*n2(2)-n1(2)*n2(1));
        p=[x0,y0,0];
%         disp(dot(p,n1)-d1);
%         disp(dot(p,n2)-d2);
    end
end