function [C, L] = lagran(X, Y)
% Lagrange Interpolating Polynomial 拉格朗日多项式
% Input - X  a vector contains a list of abscissas 横坐标
%       - Y  a vector contains a list of ordinates 纵坐标
% Output - C  a matrix contains the coefficients of the Lagrange Interpolating Polynomial
%        - L  a matrix contains the Lagrange coefficient polynomials
% function - poly() Polynomial with specified roots or characteristic polynomial
%                   由多项式的根求多项式，由特征多项式的根，即特征值求特征多项式。
%          - conv() Polynomial with specified roots or characteristic polynomial
%                   生成一个向量，分量为两个多项式乘积所得多项式的系数

% Initialization
n = length(X); % number of points
L = zeros(n, n);

% Form the Lagrange coefficient polynomials
for k = 1:n
    V = 1;
    for j = 1:n
        if k ~= j
            V = conv(V, poly(X(j))) / (X(k)-X(j));
        end
    end
    L(k,:) = V;
end

% Determine the coefficients of the Lagrange Interpolating Polynomial
C = Y * L;
end

