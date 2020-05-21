function [p0, y, k, err] = newton(f, df, p0, delta, epsilon, N)
% Newton Raphson method Å£¶Ù·¨
% Input - f       the input function as a string
%       - df      the derivative of f as a string
%       - p0      the initial approximation to zero point of f
%       - delta   tolerance for the value of zero point
%       - epsilon tolerance for the value of function f at zero point
%       - N       maximum number of iterations
% Output - p0     the approximation to zero point of input function
%        - y      = f(p0)
%        - k      the number of iterations
%        - err    the error in the approximation

fprintf('Initial guess\t p0 = %f\n', p0);

for k = 1:N
    p1 = p0 - (feval(f, p0) / feval(df, p0));
    err = abs(p1 - p0);
    relerr = 2 * err / (abs(p1) + delta);
    p0 = p1;
    y = feval(f, p0);
    
    % Print intermediate messages
    fprintf('Interation NO.%d,\t p0=%f\t f(p0)=%f\n', k, p0, y);
    
    if (err < delta) || (relerr < delta) || (abs(y) < epsilon)
        break, end
end
