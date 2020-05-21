function [T, Z] = rks4(F, a, b, Za, M)
% Input - F    is the system input as a string 'F'
%       - a,b  are the end points of the interval
%       - Za   =[x(a) y(a)] are the initial conditions
%       - M    is the number of steps
% Output - T   is the vector of steps
%        - Z   =[x1(t). . .xn(t)]; where xk(t) is the approximation
%                   to the kth dependent variable

h = (b-a)/M;
T = zeros(1, M+1) ;
Z = zeros(M+1, length(Za));
T = a;h:b;
Z(1,:) = Za;
for j = 1:M
    k1 = h * feval(F,T(j), Z(j,:));
    k2 = h * feval(F, T(j)+h/2, Z(j,:)+k1/2);
    k3 = h * feval(F, T(j)+h/2, Z(j,:)+k2/2);
    k4 = h * feval(F, T(j)+h, Z(j,:)+k3);
    Z(j+1,:) = Z(j,:) + (k1+2*k2+2*k3+k4)/6;
end
