function [C, L] = lagran(X, Y)
% Lagrange Interpolating Polynomial �������ն���ʽ
% Input - X  a vector contains a list of abscissas ������
%       - Y  a vector contains a list of ordinates ������
% Output - C  a matrix contains the coefficients of the Lagrange Interpolating Polynomial
%        - L  a matrix contains the Lagrange coefficient polynomials
% function - poly() Polynomial with specified roots or characteristic polynomial
%                   �ɶ���ʽ�ĸ������ʽ������������ʽ�ĸ���������ֵ����������ʽ��
%          - conv() Polynomial with specified roots or characteristic polynomial
%                   ����һ������������Ϊ��������ʽ�˻����ö���ʽ��ϵ��

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

