function [obj]=obj2mat(objpath,matpath)
    % ����readObj����
    addpath(genpath('..\..\readObj\'));

    % ��ȡOBJ�ļ�
    obj = readObj(objpath);
    p=obj.v
    % ����Ϊ.mat�ļ�
    save(matpath, 'p');
end