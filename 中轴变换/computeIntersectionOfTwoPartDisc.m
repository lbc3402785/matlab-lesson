function [v1,theta1,v2,theta2,num,success]=computeIntersectionOfTwoPartDisc(center,radius,normal,u1,radian1,u2,radian2)
    costheta=dot(u1,u2);%�޷���н�
    %У������
    if dot(cross(u1,u2),normal)<0
       tmp=u1;
       u1=u2;
       u2=tmp;
       tmpR=radian1;
       radian1=radian2;
       radian2=tmpR;
    end
    %��u1Ϊ��ʼ��ת�ᣬ��һ������Ϊ[-radian1,radian1]
    theta=acos(costheta);
    %�ڶ�������Ϊ[theta-radian2,theta+radian2]
    if (radian1<theta-radian2)
        %�޽���
        success=false;
        return;
    else if (radian1>theta-radian2&&radian1<theta)
        %1������ 
        num=1;
        theta1=(radian1+radian2-theta)*0.5;
        
    end
end