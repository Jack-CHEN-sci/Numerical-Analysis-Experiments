function [c, yc, err] = regula(f, a, b, delta, epsilon, N)
% Regula falsi method ÊÔÎ»·¨
% Input - f       the input function as a string
%       - a       the left end point of the initial section
%       - b       the right end point of the initial section
%       - delta   tolerance for the value of zero point
%       - epsilon tolerance for the value of function f at zero point
%       - N       maximum number of iterations
% Output - c      the zero point of input function
%        - yc     = f(c)
%        - err    the error in the approximation

% Initialization
ya = feval(f, a);
yb = feval(f, b);
% Check condition
if ya*yb > 0
    disp('The end-points value of the initial section should not be of the same sign');
    return
end

for k = 1:N
    dx = yb*(b - a) / (yb - ya);
    c = b - dx;
    ac = c - a;
    yc = feval(f, c);
    
    % Print intermediate messages
    fprintf('Interation NO.%d,\t current section = [%f,%f],\t c=%f,\t f(c)=%f\n',...
            k, a, b, c, yc);
    
    if yc == 0
        break
    elseif yb*yc > 0
        b = c;
        yb = yc;
    else
        a = c;
        ya = yc;
    end
    
    dx = min(abs(dx), ac);
    if abs(dx) < delta
        break, end
    if abs(yc) < epsilon
        break, end
end

err = abs(b-a)/2;
yc = feval(f, c);