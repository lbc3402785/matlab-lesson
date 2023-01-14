function [bottom,top]=computeBoundingBoxForSpherialSector(u,radian)
    cosRadian=cos(radian);
    bottom=[min(0,-solveAxis([-1,0,0],u,cosRadian)),min(0,-solveAxis([0,-1,0],u,cosRadian)),min(0,-solveAxis([0,0,-1],u,cosRadian))];
    top=[max(0,solveAxis([1,0,0],u,cosRadian)),max(0,solveAxis([0,1,0],u,cosRadian)),max(0,solveAxis([0,0,1],u,cosRadian))];
end