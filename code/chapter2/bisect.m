function [c, yc, err] = bisect(f, a, b, TOL)
% Bisection method ¶þ·Ö·¨
% Input - f   the input function as a string
%       - a   the left end point of the initial section
%       - b   the right end point of the initial section
%       - TOL tolerance
% Output - c   the zero point of input function
%        - yc  = f(c)
%        - err the error in the approximation

% Initialization
ya = feval(f, a);
yb = feval(f, b);
% Check condition
if ya*yb > 0
    disp('The end-points value of the initial section should not be of the same sign');
    return
end

% Compute the number of needed iteration round
N = 1 + round((log(b-a)-log(TOL))/log(2));
% Main process
for k = 1:N
    c = (a+b)/2;
    yc = feval(f, c);
    
    % Print intermediate messages
    fprintf('Interation NO.%d,\t current section = [%f,%f],\t c=%f,\t f(c)=%f\n',...
            k, a, b, c, yc);
    
    if yc == 0
        a = c;
        b = c;
    elseif yb * yc > 0
        b = c;
        yb = yc;
    else
        a = c;
        ya = yc;
    end
    
    if (b - a) < TOL
        break, end
end

c = (a + b)/2;
yc = feval(f, c);
err = abs(b-a);

end

