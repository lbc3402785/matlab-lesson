function R=circumRadius(A,B,C)
    a=norm(B-C);
    b=norm(A-C);
    c=norm(A-B);
    R=a*b*c/(sqrt((a+b+c)*(a+b-c)*(a+c-b)*(b+c-a)));
end