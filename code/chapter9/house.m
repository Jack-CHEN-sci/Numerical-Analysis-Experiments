function [W,A] = house(A)
% Householder QR Factorization
% Input  - A  a symmetric matrix can be factorized as Q*R
% Output - W  NOT the factorized orthogonal matrix Q!
%        - A  the upper triangle matrix

[m,n] = size(A);
W = zeros(m, n);
for k = 1:n
    x = A(k:m, k);
    v = x;
    v(1) = sign(x(1))*norm(x) + v(1);
    v = v/norm(v);
    A(k:m,k:n) = A(k:m,k:n) - 2*v* (v'*A(k:m,k:n));
    W(k:m, k) = v;
end

end
