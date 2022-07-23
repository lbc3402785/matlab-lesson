%r = linspace(0,2*pi) ;
%th = linspace(0,2*pi) ;
%[R,T] = meshgrid(r,th) ;
%X = R.*cos(T) ;
%Y = R.*sin(T) ;
%Z = R ;
%surf(X,Y,Z)
r1=3;
r2=1;
c1=[2,2,4];
c2=[8,2,3];
drawCone(c1,c2,r1,r2,180,64);