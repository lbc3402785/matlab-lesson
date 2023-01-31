function result=mergeStricts(stricts,normal)
%�����Ĺ��ܣ�
%������������
%������ʹ�ã�y=func(input1,input2)
%���룺
%     stricts:java.util.Stack<java.util.HashMap>()
%�����
%     result:
%���ӣ�y=func(1,'type1');
%ע��������ú��������÷�Χ��
%�ĵ����ڣ�
%��ǩ��
%�������ڣ�
%���������ڣ�
    if(stricts.size()<2)
        error('length is not enough!');
    end
    result=java.util.ArrayList();
    p1=stricts.pop();%HashMap
    p2=stricts.pop();%HashMap
    [inter1,inter2,num]=computeIntersectionOfTwoDiscSector(normal,transpose(p1.get('u')),p1.get('radian'),transpose(p2.get('u')),p2.get('radian'));
    if num==1
        p=java.util.HashMap();
        p.put('u',inter1.u);
        p.put('radian',inter1.radian);
        if (stricts.empty())
            result.add(p);
            return;
        else
            stricts.push(p);
            tmp=mergeStricts(stricts,normal);
            result=tmp;
        end
    elseif num==2
        p1=java.util.HashMap();
        p1.put('u',inter1.u);
        p1.put('radian',inter1.radian);
        p2=java.util.HashMap();
        p2.put('u',inter2.u);
        p2.put('radian',inter2.radian);
        if (stricts.empty())
            result.add(p1);
            result.add(p2);
            return;
        else
            copy=stricts.clone();
            stricts.push(p1);
            result1=mergeStricts(stricts,normal);
            copy.push(p2);
            result2=mergeStricts(copy,normal);
            result.addAll(result1);
            result.addAll(result2);
        end
    end
end