function response = harris_response( M , alpha )
%HARRIS_RESPONSE computes the response of the Harris detector
%   Using det and trace operations.

response = det(M) + alpha*trace(M)^2;

end

