function y = f(x)
%syms x;
y = (1/sqrt(2*pi)) * exp(-(x^2)/2);
%fy = int(y,0,1);