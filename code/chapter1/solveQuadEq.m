function [x1,x2] = solveQuadEq(a,b,c)
% Solve the roots of a quadratic equation 二次方程求根
% Input - a,b,c    coefficients of the equation
% Output - x1,x2   roots of the equation

% Initialization
x1 = 0;
x2 = 0;
delta = b^2 - 4*a*c;

% Compute the roots
if delta>=0
	if b>0
		x1 = (-2*c)/(b+sqrt(delta));
		x2 = (-b-sqrt(delta))/2*a;
	else 
		x1 = (-b+sqrt(delta))/2*a;
		x2 = (-2*c)/(b-sqrt(delta));
	end
end
end
