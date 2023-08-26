% ���������ǻ�������ΪOBJģ��
function triangulateAndSave(points, filename)
    % �����ά͹��
    convexHull = convhull(points(:,1), points(:,2));

    % ʹ�� map �����������֮���ӳ���ϵ
    pointIndexMap = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    for i = 1:length(convexHull)
        key = num2str(points(convexHull(i),:));
        pointIndexMap(key) = i;
    end

    % ��͹���������ǻ�
    tri = delaunayTriangulation(points(convexHull,:));
    faces = tri.ConnectivityList;

    % ����ΪOBJģ���ļ�
    outfile = fopen(filename, 'w');
    if outfile ~= -1
        % д�붥��
        for i = 1:length(convexHull)
            fprintf(outfile, 'v %f %f 0.0\n', points(convexHull(i),1), points(convexHull(i),2));
        end

        % д����������Ƭ
        for i = 1:size(faces, 1)
            v1 = num2str(points(faces(i,1),:));
            v2 = num2str(points(faces(i,2),:));
            v3 = num2str(points(faces(i,3),:));
            fprintf(outfile, 'f %d %d %d\n', pointIndexMap(v1), pointIndexMap(v2), pointIndexMap(v3));
        end

        fclose(outfile);
        disp('OBJģ���ļ�����ɹ�');
    else
        disp('�޷����ļ�');
    end
end