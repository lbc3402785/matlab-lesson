classdef Ray
    properties
        origin
        direction
    end
    methods
        function obj = Ray(origin,direction)
            obj.origin=origin;
            obj.direction=direction;
        end
    end
end