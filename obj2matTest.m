% 添加import_obj工具箱的路径
addpath(genpath('..\..\readObj\'));
addpath(genpath('..'));
addpath(genpath('..\geometry'));
addpath(genpath('..\utils'));
obj2mat('E:/data/common-3d-test-models/data/elephant.obj','simple-elephant.mat')