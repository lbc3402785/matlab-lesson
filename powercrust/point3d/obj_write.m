function obj_write(filename,vertices,faces )
fid=fopen(filename,'w');  
[n,d]=size(vertices);  
 for i=1:n
    fprintf(fid,'v ');
    for j=1:d-1  
        fprintf(fid,'%f ',vertices(i,j));  
    end  
    fprintf(fid,'%f\r\n',vertices(i,d));%ÿһ�лس�\n  
    %fprintf(fid,'\n');%ÿһ�лس�\n  
 end 

fprintf(fid,'\n');%ÿһ�лس�\n  

[n,d]=size(faces);  
  
 for i=1:n
    fprintf(fid,'f ');
    for j=1:d-1  
        fprintf(fid,'%d ',faces(i,j));  
    end  
    fprintf(fid,'%d\r\n',faces(i,d));%ÿһ�лس�\n  
    %fprintf(fid,'\n');%ÿһ�лس�\n  
end   
fclose(fid);  
end
%��������������������������������
%��Ȩ����������ΪCSDN������������͵Сȭȭ����ԭ�����£���ѭCC 4.0 BY-SA��ȨЭ�飬ת���븽��ԭ�ĳ������Ӽ���������
%ԭ�����ӣ�https://blog.csdn.net/u013925378/article/details/107181734