function [bottom,top]=computeBoundingBoxForSphericalSector(u,radian)
    cosRadian=cos(radian);
    bottom=[min(0,-solveAxisForSphericalSector([-1,0,0],u,cosRadian)),min(0,-solveAxisForSphericalSector([0,-1,0],u,cosRadian)),min(0,-solveAxisForSphericalSector([0,0,-1],u,cosRadian))];
    top=[max(0,solveAxisForSphericalSector([1,0,0],u,cosRadian)),max(0,solveAxisForSphericalSector([0,1,0],u,cosRadian)),max(0,solveAxisForSphericalSector([0,0,1],u,cosRadian))];
end