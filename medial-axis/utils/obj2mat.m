function [obj]=obj2mat(objpath,matpath)
    % 加载readObj函数
    addpath(genpath('..\..\readObj\'));

    % 读取OBJ文件
    obj = readObj(objpath);
    p=obj.v
    % 保存为.mat文件
    save(matpath, 'p');
end