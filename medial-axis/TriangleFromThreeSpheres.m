function [st0,st1,n0,n1,success]=TriangleFromThreeSpheres(c0,r0,c1,r1,c2,r2)
%函数的功能：
%函数的描述：
%函数的使用：y=func(input1,input2)
%输入：
%     c0:the biggest sphere
%     v:旋转轴
%输出：
%     Y:
%例子：y=func(1,'type1');
%注意事项：利用函数的适用范围。
%文档日期：
%标签：
%创建日期：
%最后更新日期：
    c0c1=(c1-c0);
    c0c2=(c2-c0);
    c1c2=(c2-c1);
    c0c1len=(norm(c0c1));
    c0c2len=(norm(c0c2));
    c1c2len=(norm(c1c2));
    dr0r1=(abs(r0-r1));
    dr0r2=(abs(r0-r2));
    dr1r2=(abs(r1-r2));
    if( (c0c1len < 1e-8) || (c0c2len < 1e-8) || (c1c2len < 1e-8) )
        disp('some spheres are concentric and there are no triangles');
        success=false;
        return;
    end
    normal = cross(c0c1,c0c2);
    normal=normal/norm(normal);
    if ( (dr0r1 < 1e-8) && (dr0r2 < 1e-8) && (dr1r2 < 1e-8) )
        n0=normal;
        n1=-normal;
        success=true;
    else
        if (dr0r1 < 1e-8)
            apex0 = (r2 * c0 - r0 * c2) / (r2 - r0);%apex0 for c0 and c2
            apex1 = (r2 * c1 - r1 * c2) / (r2 - r1);%apex1 for c1 and c2
        elseif (dr0r2 < 1e-8)
            apex0 = (r1 * c0 - r0 * c1) / (r1 - r0);%apex0 for c0 and c1
            apex1 = (r2 * c1 - r1 * c2) / (r2 - r1);%apex1 for c1 and c2  
        elseif (dr1r2 < 1e-8)
            apex0 = (r2 * c0 - r0 * c2) / (r2 - r0);%apex0 for c0 and c2
            apex1 = (r0 * c1 - r1 * c0) / (r0 - r1);%apex1 for c0 and c1
        else
            apex0 = (r2 * c0 - r0 * c2) / (r2 - r0);%apex0 for c0 and c2
            apex1 = (r2 * c1 - r1 * c2) / (r2 - r1);%apex1 for c1 and c2
        end

        [distc0,fp,success]=DistanceToLine(c0,apex0,apex1);
        if success
            sangle = r0/distc0;
            if (abs(sangle) > 1.)
                success=false;
                return;
            end
            cangle = sqrt(1.-r0*r0/distc0/distc0);
            norfpc0=(c0-fp);
            norfpc0=norfpc0/norm(norfpc0);
            newnorm0 = normal*cangle - norfpc0*sangle;
            newnorm1 = -normal*cangle - norfpc0*sangle;
            %-----------------------------------------
            n0=newnorm0;
            %-----------------------------------------
            n1=newnorm1;
        end
    end
end