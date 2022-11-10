V=[2,2,2]; %the normal to the plane of the triangle
V=V/norm(V); % unit vector for the normal
A=(p1-in)/norm(p1-in); % a unit vector on the plane passing through center of the circle
B=cross(A,V); % a vector perpendicular to A and in the plane of the triangle. A and B act as the axes
th=0:0.01:2*pi;
x=in(1)+r*cos(th)*A(1)+r*sin(th)*B(1);
y=in(2)+r*cos(th)*A(2)+r*sin(th)*B(2);
z=in(3)+r*cos(th)*A(3)+r*sin(th)*B(3);
hold on
l=plot3(x,y,z)