function [ result ] = checkResult(vec1, vec2 )

    result = [(norm(vec1-vec2) <= 5), norm(vec1-vec2)];

end