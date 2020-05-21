function C = lspoly(X, Y, M)
% Least square polynomial approximation 最小二乘多项式拟合
% Input  -  X  is the 1xn abscissa vector
%        -  Y  is the 1xn ordinate vector
%        -  M  is the degree of least square polynomial
% Output -  C  is the coefficient list for the polynomial

n = length(X);
B = zeros(1:M+1);
F = zeros(n,M+1);
% Fill the columns of F with the powers of X
for k = 1:M+1
    F(:,k) = X'.^(k-1);
end

A = F'* F;
B = F'*Y';
C = A\B;
C = flipud(C);
end