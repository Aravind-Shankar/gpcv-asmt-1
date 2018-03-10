function [ K ] = mod_chol( C )
%MOD_CHOL Summary of this function goes here
%   Return approx upper tri K s.t. C = K * K'
[U, S, ~] = svd(inv(C));
[~,R] = qr(sqrt(S) * U');
K = inv(R);

end

