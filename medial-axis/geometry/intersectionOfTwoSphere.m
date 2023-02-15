function [u1,radian1,u2,radian2,isIntersect]=intersectionOfTwoSphere(c1,r1,c2,r2)
     d=norm(c1-c2);
     u1=(c1-c2)/norm(c1-c2);
     u2=-u1;
     radian1=pi;
     radian2=pi;
     if(r1+r2<=d)
         disp('no intersection!');
         isIntersect=false;
         return;
     end
     if(d + min(r1,r2) <=max(r1,r2))
         disp('one sphere is contained by another!');
         isIntersect=false;
         return;
     end
     cosa1=(r1*r1+d*d-r2*r2)/(2*r1*d);
     radian1=pi-acos(cosa1);
     cosa2=(r2*r2+d*d-r1*r1)/(2*r2*d);
     radian2=pi-acos(cosa2);
     isIntersect=true;
end