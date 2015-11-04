%% 2D Chebyshev grid

% Calculates the [X,Y] grid obtained by the mesh of two vx, vy vectors.

function [X,Y] = chebynodes_grid (a1, b1, n1, a2, b2, n2)

vx = chebynodes(a1,b1,n1);
vy = chebynodes(a2,b2,n2);

[X,Y] = meshgrid(vx,vy);

end