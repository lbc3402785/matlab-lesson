function [bottom,top]=computeBoundingBoxForSphericalCap(u,radian)
    cosRadian=cos(radian);
    bottom=[-solveAxisForSphericalCap([-1,0,0],u,cosRadian),-solveAxisForSphericalCap([0,-1,0],u,cosRadian),-solveAxisForSphericalCap([0,0,-1],u,cosRadian)];
    top=[solveAxisForSphericalCap([1,0,0],u,cosRadian),solveAxisForSphericalCap([0,1,0],u,cosRadian),solveAxisForSphericalCap([0,0,1],u,cosRadian)];
end