function [project,check,key]=solveAxisForAnySphericalCap(e,us,cosRadians,ps)
    key=[0,0,0];
    if(us.size()<2)
        error('less than two spherical cap!');
    end
    eus=java.util.ArrayList();
    for i=0:(us.size()-1)
        eui=dot(e,us.get(i));
        eus.add(eui);
    end
    checkAll=true;
    for i=0:(eus.size()-1)
        if eus.get(i)<cosRadians.get(i)
            checkAll=false;
            break;
        end
    end
    if(checkAll)
        project=1.0;
        check=true;
        key=(e);
        return;
    end
    project=1.0;
    allOppose=true;
    for i=0:(eus.size()-1)
        if eus.get(i)==-1
            if(-cosRadians.get(i)<project)
                project=-cosRadians.get(i);
                ui=us.get(i);
                vi=[0,0,0];
                if (abs(ui(1))>abs(ui(2)))
                    vi=[-ui(3),0,ui(1)];
                else
                    vi=[0,ui(3),-ui(2)];
                end
                vi=vi/norm(vi);
                key=(transpose(ui)*cosRadians.get(i)+sqrt(1-cosRadians.get(i)*cosRadians.get(i))*vi);
            end
        else
            allOppose=false;
            break;
        end
    end
    if(allOppose)
        check=true;
        return;
    end
    check=false;
    project=-1;
    for i=0:(eus.size()-1)  
        deti=-1;
        if(eus.get(i)~=1&&eus.get(i)~=-1)
            deti=(cosRadians.get(i)*cosRadians.get(i)-1.0)/(eus.get(i)*eus.get(i)-1.0);
        end
        if deti>=0
            %球面上有解
            a1=sqrt(deti);
            a2=-sqrt(deti);
            b1=cosRadians.get(i)-a1*eus.get(i);
            v1=a1*e+b1*transpose(us.get(i));
            v1=v1/norm(v1);
            tmp=checkExcept(v1,us,cosRadians,i);
            if(tmp)
                if(b1*eus.get(i)+a1>project);
                    project=b1*eus.get(i)+a1;
                    check=true;
                    key=(v1);
                end
            end
            b2=cosRadians.get(i)-a2*eus.get(i);
            v2=a2*e+b2*transpose(us.get(i));
            v2=v2/norm(v2);
            tmp=checkExcept(v2,us,cosRadians,i);
            if(tmp)
                if(b2*eus.get(i)+a2>project);
                    project=b2*eus.get(i)+a2;
                    check=true;
                    key=(v2);
                end
            end
        end
    end

    for i=0:(ps.size()-1)
        if(checkAllRestricts(ps.get(i),us,cosRadians))
            xi=dot(e,ps.get(i));
            if(xi>project)
                project=xi;
                check=true;
                key=transpose(ps.get(i));
            end
        end
    end
    
end
function [check]=checkAllRestricts(p,us,cosRadians)
    for i=0:(cosRadians.size()-1)
        cosRadian=dot(p,us.get(i));
        if(cosRadian<cosRadians.get(i)-1e-3)
            check=false;
            return;
        end  
    end
    check=true;
end
function [check]=checkExcept(v,us,cosRadians,k)
    for i=0:(cosRadians.size()-1)
        if(i~=k)
            cosRadian=dot(v,transpose(us.get(i)));
            if(cosRadian<cosRadians.get(i)-1e-3)
                check=false;
                return;
            end
        end
    end
    check=true;
end