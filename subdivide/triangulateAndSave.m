% 函数：三角化并保存为OBJ模型
function triangulateAndSave(points, filename)
    % 计算二维凸包
    convexHull = convhull(points(:,1), points(:,2));

    % 使用 map 建立点和索引之间的映射关系
    pointIndexMap = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    for i = 1:length(convexHull)
        key = num2str(points(convexHull(i),:));
        pointIndexMap(key) = i;
    end

    % 对凸包进行三角化
    tri = delaunayTriangulation(points(convexHull,:));
    faces = tri.ConnectivityList;

    % 保存为OBJ模型文件
    outfile = fopen(filename, 'w');
    if outfile ~= -1
        % 写入顶点
        for i = 1:length(convexHull)
            fprintf(outfile, 'v %f %f 0.0\n', points(convexHull(i),1), points(convexHull(i),2));
        end

        % 写入三角形面片
        for i = 1:size(faces, 1)
            v1 = num2str(points(faces(i,1),:));
            v2 = num2str(points(faces(i,2),:));
            v3 = num2str(points(faces(i,3),:));
            fprintf(outfile, 'f %d %d %d\n', pointIndexMap(v1), pointIndexMap(v2), pointIndexMap(v3));
        end

        fclose(outfile);
        disp('OBJ模型文件保存成功');
    else
        disp('无法打开文件');
    end
end