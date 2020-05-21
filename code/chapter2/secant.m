function [p1, y, k, err] = secant(f, p0, p1, delta, epsilon, N)
% Secant method ¸îÏß·¨
% Input - f       the input function as a string
%       - p0      the initial approximation to zero point of f
%       - p1      the initial approximation to zero point of f
%       - delta   tolerance for the value of zero point
%       - epsilon tolerance for the value of function f at zero point
%       - N       maximum number of iterations
% Output - p1     the approximation to zero point of input function
%        - y      = f(p0)
%        - k      the number of iterations
%        - err    the error in the approximation

fprintf('Initial guess\t p0 = %f, p1 = %f\t f(p1)=%f\n', p0, p1, feval(f, p1));

for k = 1:N
    p2 = p1 - feval(f, p1) * (p1 - p0) / (feval(f, p1) - feval(f, p0));
    err = abs(p2 - p1);
    relerr = 2 * err / (abs(p2) + delta);
    p0 = p1;
    p1 = p2;
    y = feval(f, p1);
    
    % Print intermediate messages
    fprintf('Interation NO.%d,\t p0 = %f, p1 = %f\t f(p1)=%f\n', k, p0, p1, y);
    
    if (err < delta) || (relerr < delta) || (abs(y) < epsilon)
        break, end
end