clc 
clear
close all

%Instructions :

%just uncomment one of the following line and run


%% Points cloud :
clear all
% load Cactus.mat
% load Skull.mat 
% load Standford_Bunny.mat
% load Horse.mat
% load hippo.mat 
% load Elephant.mat
% load chair.mat
% load Dino.mat
% load Block.mat
% load gargo50k.mat
% load teapot.mat
% load cow.mat
%load happy.mat
%load fandisk.mat
load airplane_0627.mat
%% plot of the current point cloud
% figure(1);
% hold on
% axis equal
% title('Points Cloud','fontsize',14)
% plot3(p(:,1),p(:,2),p(:,3),'g.')
% view(-37.5,30)
% 
%% Run  program
pold=p;
[t]=MyCrust(p);
%% plot of the oyput triangulation
figure(2)
        hold on
        title('Output Triangulation','fontsize',14)
        axis equal
        trisurf(t,p(:,1),p(:,2),p(:,3),'facecolor','c','edgecolor','b')%plot della superficie trattata
        view(-37.5,30);
 obj_write('fandisk.obj',pold,t);