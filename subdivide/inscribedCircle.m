function [center,r]=inscribedCircle(A,B,C)
a=norm(B-C);
b=norm(A-C);
c=norm(A-B);
r=sqrt((a+b+c)*(a+b-c)*(a+c-b)*(b+c-a))/(2*(a+b+c));
center=(a*A+b*B+c*C)/(a+b+c);
end