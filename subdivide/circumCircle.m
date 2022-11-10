function [center,r]=circumCircle(A,B,C)
    a=det([B-A;C-A]);
    bx=-det([sum(B.*B)-sum(A.*A),B(2)-A(2);sum(C.*C)-sum(A.*A),C(2)-A(2)]);
    by=det([sum(B.*B)-sum(A.*A),B(1)-A(1);sum(C.*C)-sum(A.*A),C(1)-A(1)]);
    c=-det([sum(A.*A),A(1),A(2);sum(B.*B),B(1),B(2);sum(C.*C),C(1),C(2)]);
    center=[-bx/(2*a),-by/(2*a)];
    r=sqrt(bx*bx+by*by-4*a*c)/(2*abs(a));
end