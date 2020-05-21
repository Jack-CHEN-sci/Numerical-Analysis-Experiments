function y = f(x)
% Input function
% Usage Attention:
%   1. For programs contains function feval()
%      This input function should be converted into a string
%   2. For programs contains the derivative of f
%      Remember to check whether df is correct

% y = -((x.^2)/4) + x + 1;
% y = x * sin(x) - 1;
% y = x.^3 - 3*x + 2;
% y = 15 - 2*x.^2;
% y = 15 ./ (2*x+1);
% y = x - (2*x.^2 + x - 15)/(4*x + 1);
y = 2*x.^2 + x - 15;
end