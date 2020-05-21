function [k, p, err, P] = fixpt(g, p0, TOL, N)
% Fixed Point Interation 不动点迭代
% Input - g    the iteration function as a string
%       - p0   initial guess for the fixed point
%       - TOL  tolerance
%       - N    the maximum number of iterations
% Output - k   the number of iterations carried out
%        - p   the approximation of the fixed point
%        - err the error in the approximation
%        - P   sequence {p_n}

% Initialization
P(1) = p0; % initial guess
if nargin < 3
    TOL = 1e-3; % tolerance default
end
if nargin < 4
    N = 200; % maximum interation default
end

% Compute fixed point
for k = 2:N
    P(k) = feval(g, P(k-1));
    err = abs(P(k) - P(k-1));
    relerr = err/(abs(P(k)) + eps);
    p = P(k);
    %fprintf('Interation NO.%d,\t approximation p=%f,\t absolute error=%f,\t relative error=%f\n',...
            %k, p, err, relerr);
    fprintf('%d\t  %f\t %f\t %f\n',...
            k, p, err, relerr);
    if (err < TOL) || (relerr < TOL)
        break, end
end

if k == N
    disp('Maximum number of iterations exceeded');
end
P = P'; % transpose the vector

end

