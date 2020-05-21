function [lambda,V] = sympower(A, X, epsilon, max1)
% Input  - A   is an nxn matrix
%        - X   is the nx1 starting vector
%        - epsilon   is the tolerance
%        - max1 is the maximum number of iterations
% Output - lambda is the dominant eigenvalue
%        - V is the dominant eigenvector

X = X/norm(X,2);
for k = 2:max1
    Y = A*X;
    u = X'*Y;
    if norm(Y,2) == 0
        break, end
    err = norm((X-Y/norm(Y,2)),2);
    X = Y/norm(Y,2);
    if(err < epsilon)
        break, end
end
lambda = u;
V = X;
end