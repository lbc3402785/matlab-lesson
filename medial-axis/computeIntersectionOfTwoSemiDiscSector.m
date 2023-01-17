function [intersection]=computeIntersectionOfTwoSemiDiscSector(s0,s1)
    normalize(s0);
    normalize(s1);
    if (s0.a0 > s1.a0)
        tmp=s0;
        s0=s1;
        s1=tmp;
    end
    intersection.isIntersecting = false;
    if (isSectorNormalized(s0) && isSectorNormalized(s1) && s0.a0 <= s1.a0)
        if (s1.a0 < s0.a1) % s1.a0 inside s0 ?
            intersection.isIntersecting = true;
            intersection.a0 = s1.a0;
            intersection.a1 = min(s0.a1, s1.a1);
        elseif (s0.a0+2*pi < s1.a1) % (s0.a0+2*PI) inside s1 ?
            intersection.isIntersecting = true;
            intersection.a0 = s0.a0;
            intersection.a1 = min(s0.a1, s1.a1-2*pi);
        end
        if (~intersection.isIntersecting || isSectorNormalized(intersection))
            return;
        else
            error('compute error!');
        end
    else
        error('sector is not normalized!');
    end
end
function [check]=isNormalized(a)
   check= (-pi < a && a <= pi);
end
function [check]=isSectorNormalized(s)
   check= (isNormalized(s.a0) && s.a0 <= s.a1 && s.a1 < s.a0+pi);
end
function [check]=normalize(s)
    if (s.a0>pi)
        s.a0=s.a0-2*pi;
    elseif (s.a0<-pi)
        s.a0=s.a0+2*pi;
    end 
    if (s.a1>pi)
        s.a1=s.a1-2*pi;
    elseif (s.a1<-pi)
        s.a1=s.a1+2*pi;
    end 
    if isNormalized(s.a0) && isNormalized(s.a1)
        a1_bigger =0;
        if (s.a0 <= s.a1)
            a1_bigger=s.a1;
        else
            a1_bigger=s.a1+2*pi;
        end
        if (a1_bigger >= s.a0+pi)
            tmp=s.a0;
            s.a0=s.a1;
            s.a1=tmp;
        end
        if (s.a1 < s.a0)
            s.a1 =s.a1 + 2*pi;
        end
        check=isSectorNormalized(s);
    else
        error('sector s is not normalized!');
    end
end