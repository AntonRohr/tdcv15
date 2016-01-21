function [ result ] = emPowerFunc(OT, OI )
%EMGRAYPOWERFUNCTION Summary of this function goes here
%   Detailed explanation goes here


countValid = 0;
cosSum = 0;
for row = 1:size(OT, 1)
    for col = 1:size(OI, 2)
        if (round(OT(row,col)) ~= 10000)
            countValid = countValid +1;
            if (round(OI(row,col)) ~= 10000)
                cosSum = cosSum + abs(cosd(OT(row,col)-OI(row,col)));
            end
        end
    end
end
if(countValid > 0)
    result = cosSum / countValid;
else
    result = 0;
end

end

