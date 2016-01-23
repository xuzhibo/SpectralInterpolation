%% Chebyshev polynomials
% Calculates the polynomials functions of N degree, interval [a,b]

function [chebypolys] = chebypoly(x,a,b,N)

% Necessary transformation to ensure that x lies in [-1,1]
x = (2 * (x-a) / (b-a) ) - 1;

% Initialization
chebypolys = zeros(N,length(x));

% T_1(x) = 1
chebypolys(1,:) = 1;

% T_2(x) = x
if N > 1
    chebypolys(2,:) = x;
end

% for n>2, T_n(x) = 2*x*T_{n-1}(x) - T_{n-2}(x)
if N > 2
    for k = 3:N
        chebypolys(k,:) = 2 * x.* chebypolys(k-1,:) - chebypolys(k-2,:);
    end
end

end