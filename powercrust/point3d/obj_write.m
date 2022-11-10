function obj_write(filename,vertices,faces )
fid=fopen(filename,'w');  
[n,d]=size(vertices);  
 for i=1:n
    fprintf(fid,'v ');
    for j=1:d-1  
        fprintf(fid,'%f ',vertices(i,j));  
    end  
    fprintf(fid,'%f\r\n',vertices(i,d));%每一行回车\n  
    %fprintf(fid,'\n');%每一行回车\n  
 end 

fprintf(fid,'\n');%每一行回车\n  

[n,d]=size(faces);  
  
 for i=1:n
    fprintf(fid,'f ');
    for j=1:d-1  
        fprintf(fid,'%d ',faces(i,j));  
    end  
    fprintf(fid,'%d\r\n',faces(i,d));%每一行回车\n  
    %fprintf(fid,'\n');%每一行回车\n  
end   
fclose(fid);  
end
%————————————————
%版权声明：本文为CSDN博主「岁月神偷小拳拳」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
%原文链接：https://blog.csdn.net/u013925378/article/details/107181734