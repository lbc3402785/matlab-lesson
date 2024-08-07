function [inter1,inter2,num]=computeIntersectionOfTwoDiscSector(normal,u1,radian1,u2,radian2)
    costheta=dot(u1,u2);%无方向夹角
    %校正方向
    if dot(cross(u1,u2),normal)<0
       tmp=u1;
       u1=u2;
       u2=tmp;
       tmpR=radian1;
       radian1=radian2;
       radian2=tmpR;
    end
    %以u1为起始旋转轴，第一个区间为[-radian1,radian1]
    theta=acos(costheta);
    num=0;
    inter1.isIntersecting = false;
    inter2.isIntersecting = false;
    %第二个区间为[theta-radian2,theta+radian2]
    if(radian1<pi*0.5&&radian2<0.5*pi)
        s0.a0=-radian1;
        s0.a1=radian1;
        s1.a0=theta-radian2;
        s1.a1=theta+radian2;
        intersection=computeIntersectionOfTwoSemiDiscSector(s0,s1);
        if (intersection.isIntersecting)
            num=1;
            phi=(intersection.a0+intersection.a1)*0.5;
            th=-phi;
            qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
            v=quatrotate(qs,u1);
            inter1.isIntersecting=true;
            inter1.u=v;
            inter1.radian=(intersection.a1-intersection.a0)*0.5;
        end
    elseif (radian1>=pi*0.5&&radian2<0.5*pi)
        s00.a0=-radian1;
        s00.a1=0;
        s01.a0=0;
        s01.a1=radian1;
        s1.a0=theta-radian2;
        s1.a1=theta+radian2;
        inter1=computeIntersectionOfTwoSemiDiscSector(s00,s1);
        inter2=computeIntersectionOfTwoSemiDiscSector(s01,s1);
        %inter1.a0 must be leaster than inter2.a0
        if(inter1.isIntersecting&&inter2.isIntersecting&&inter1.a1>=inter2.a0)
            inter1.a1=inter2.a1;
            inter2.isIntersecting=false;
        end
        if (inter1.isIntersecting)
            num=num+1;
            phi=(inter1.a0+inter1.a1)*0.5;
            th=-phi;
            qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
            v=quatrotate(qs,u1);
            inter1.u=v;
            inter1.radian=(inter1.a1-inter1.a0)*0.5;
            if (inter2.isIntersecting)
                num=num+1;
                phi=(inter2.a0+inter2.a1)*0.5;
                th=-phi;
                qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
                v=quatrotate(qs,u1);
                inter2.u=v;
                inter2.radian=(inter2.a1-inter2.a0)*0.5;
            end
        else
            if (inter2.isIntersecting)
                num=num+1;
                phi=(inter2.a0+inter2.a1)*0.5;
                th=-phi;
                qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
                v=quatrotate(qs,u1);
                inter2.u=v;
                inter2.radian=(inter2.a1-inter2.a0)*0.5;
                inter1=inter2;
                inter1.isIntersecting=true;
                inter2.isIntersecting=false;
            end
        end
        
    elseif (radian1<pi*0.5&&radian2>=0.5*pi)
        s0.a0=-radian1;
        s0.a1=radian1;
        s10.a0=theta-radian2;
        s10.a1=theta;
        s11.a0=theta;
        s11.a1=theta+radian2;
        inter1=computeIntersectionOfTwoSemiDiscSector(s0,s10);
        inter2=computeIntersectionOfTwoSemiDiscSector(s0,s11);
        if(inter1.isIntersecting&&inter2.isIntersecting)
            if (inter1.a0 > inter2.a0)%可能需要交换顺序
                tmp=inter1;
                inter1=inter2;
                inter2=tmp;
            end
            if inter1.a1>=inter2.a0
                inter1.a1=inter2.a1;
                inter2.isIntersecting=false;
            end
        end
        if (inter1.isIntersecting)
            num=num+1;
            phi=(inter1.a0+inter1.a1)*0.5;
            th=-phi;
            qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
            v=quatrotate(qs,u1);
            inter1.u=v;
            inter1.radian=(inter1.a1-inter1.a0)*0.5;
            if (inter2.isIntersecting)
                num=num+1;
                phi=(inter2.a0+inter2.a1)*0.5;
                th=-phi;
                qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
                v=quatrotate(qs,u1);
                inter2.u=v;
                inter2.radian=(inter2.a1-inter2.a0)*0.5;
            end
        else
            if (inter2.isIntersecting)
                num=num+1;
                phi=(inter2.a0+inter2.a1)*0.5;
                th=-phi;
                qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
                v=quatrotate(qs,u1);
                inter2.u=v;
                inter2.radian=(inter2.a1-inter2.a0)*0.5;
                inter1=inter2;
                inter1.isIntersecting=true;
                inter2.isIntersecting=false;
            end
        end        
    else
        s00.a0=-radian1;
        s00.a1=0;
        s01.a0=0;
        s01.a1=radian1;
        s10.a0=theta-radian2;
        s10.a1=theta;
        s11.a0=theta;
        s11.a1=theta+radian2;
        t0=computeIntersectionOfTwoSemiDiscSector(s00,s10);
        t1=computeIntersectionOfTwoSemiDiscSector(s00,s11);
        
        %可能有相交区域
        if(t0.isIntersecting&&t1.isIntersecting)
            if (t0.a0 > t1.a0)%可能需要交换顺序
                tmp=t0;
                t0=t1;
                t1=tmp;
            end
            if(t0.a1>=t1.a0)
                t0.a1=t1.a1;
                t1.isIntersecting=false;
            end
        end
        t2=computeIntersectionOfTwoSemiDiscSector(s01,s10);
        t3=computeIntersectionOfTwoSemiDiscSector(s01,s11);
        
        %可能有相交区域
        if(t2.isIntersecting&&t3.isIntersecting)
            if (t2.a0 > t3.a0)%可能需要交换顺序
                tmp=t2;
                t2=t3;
                t3=tmp;
            end
            if(t2.a1>=t3.a0)
                t2.a1=t3.a1;
                t3.isIntersecting=false;
            end
            
        end
        if (~t0.isIntersecting&&~t1.isIntersecting&&~t2.isIntersecting&&~t3.isIntersecting)
            %error('compute error');
            return;
        end
        %合并区域 order must be t0 t1 t2 t3
        if (t0.isIntersecting&&t2.isIntersecting&&t0.a1>=t2.a0)
            t0.a1=t2.a1;
            t2.isIntersecting=false;
        end
        if (t0.isIntersecting&&t3.isIntersecting&&t0.a1>=t3.a0)
            t0.a1=t3.a1;
            t3.isIntersecting=false;
        end
        if(t1.isIntersecting&&t2.isIntersecting&&t1.a1>=t2.a0)
            t1.a1=t2.a1;
            t2.isIntersecting=false;
        end
        if(t1.isIntersecting&&t3.isIntersecting&&t1.a1>=t3.a0)
            t1.a1=t3.a1;
            t3.isIntersecting=false;
        end

        %到这里合并到最多只剩两个
        if(t0.isIntersecting)
            inter1=t0;
            if(t1.isIntersecting)
                inter2=t1;
            elseif(t2.isIntersecting)
                inter2=t2;
            elseif (t3.isIntersecting)
                inter2=t3;
            end
        elseif (t1.isIntersecting)
            inter1=t1;
            if(t2.isIntersecting)
                inter2=t2;
            elseif (t3.isIntersecting)
                inter2=t3;
            end
        else
            if(t2.isIntersecting)
                inter1=t2;
            elseif (t3.isIntersecting)
                inter1=t3;
            end
        end
        
        %output
        if(inter1.isIntersecting&&inter2.isIntersecting&&inter1.a1>=inter2.a0)
            inter1.a1=inter2.a1;
            inter2.isIntersecting=false;
        end
        if (inter1.isIntersecting)
            num=num+1;
            phi=(inter1.a0+inter1.a1)*0.5;
            th=-phi;
            qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
            v=quatrotate(qs,u1);
            inter1.u=v;
            inter1.radian=(inter1.a1-inter1.a0)*0.5;
            if (inter2.isIntersecting)
                num=num+1;
                phi=(inter2.a0+inter2.a1)*0.5;
                th=-phi;
                qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
                v=quatrotate(qs,u1);
                inter2.u=v;
                inter2.radian=(inter2.a1-inter2.a0)*0.5;
            end
        else
            if (inter2.isIntersecting)
                num=num+1;
                phi=(inter2.a0+inter2.a1)*0.5;
                th=-phi;
                qs=[cos(th/2),sin((th/2))*normal(1),sin((th/2))*normal(2),sin((th/2))*normal(3)];
                v=quatrotate(qs,u1);
                inter2.u=v;
                inter2.radian=(inter2.a1-inter2.a0)*0.5;
                inter1=inter2;
                inter1.isIntersecting=true;
                inter2.isIntersecting=false;
            end
        end
    end
    
end