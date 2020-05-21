function draw(g, P)
% Draw graph 画图，对函数和迭代过程可视化
% Input - g   the iteration function as a string
%       - P   iteration sequence {p_n}

% Visualization
xMax = max(P);
xMin = min(P);
x = ((xMin(1)-1): 0.001: (xMax(1)+1));
y = 0*x;
plot(x, y);
hold on
plot(x, feval(g, x));
hold on
plot(P, feval(g, P), 'r*');

end