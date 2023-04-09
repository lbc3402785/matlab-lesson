classdef Utils
    methods (Static)
        function [rkU,rkV] = GenerateComplementBasis(rkW)
            if (abs(rkW(1)) >=abs(rkW(2)) )
                %W.x or W.z is the largest magnitude component, swap them
                fInvLength = 1.0/sqrt(rkW(1)*rkW(1) + rkW(3)*rkW(3));
                rkU=[-rkW(3)*fInvLength,0,rkW(1)*fInvLength];
                rkV=[rkW(2)*rkU(3),rkW(3)*rkU(1)-rkW(1)*rkU(3),-rkW(2)*rkU(1)];
            else
                %W.y or W.z is the largest magnitude component, swap them
                fInvLength = 1.0/sqrt(rkW(2)*rkW(2) +rkW(3)*rkW(3));
                rkU=[0,rkW(3)*fInvLength,-rkW(2)*fInvLength];
                rkV=[rkW(2)*rkU(3)-rkW(3)*rkU(2),-rkW(1)*rkU(3),rkW(1)*rkU(2)];
            end
        end
    end
end