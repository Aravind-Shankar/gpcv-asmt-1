function [ H ] = mat_from_dconic( C )
%MAT_FROM_DCONIC Summary of this function goes here
%   Detailed explanation goes here
[U,S,V] = svd(C);
H = U;
end

