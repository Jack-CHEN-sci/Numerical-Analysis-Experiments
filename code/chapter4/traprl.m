function s = traprl(f, a, b, M)
% Composite Trapezoidal Rule 复合梯形公式
% Input  - f   the integrand input as string 'f'
%        - a,b upper and lower limits of integration
%        - M   the number of subintervals
% Output - s   the sum of Trapezoidal Rule

h = (b-a)/M;
s = 0;

for k = 1 : (M-1)
    x = a + h*k;
    s = s + feval(f,x);
end
s = h*(feval(f,a) + feval(f,b))/2 + h*s;

end

