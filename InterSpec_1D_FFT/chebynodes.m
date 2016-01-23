%% Chebyshev nodes
% Given an interval (a,b), calculates the associated n Chebyshev nodes.

function nodes = chebynodes(a, b, n)

nodes = zeros(1,n);

for ii = 1:1:n
    nodes(1,ii) = 0.5 * (b + a) - 0.5 * (a - b) * cos(((ii - 1) * pi)/(n - 1));
end

end
