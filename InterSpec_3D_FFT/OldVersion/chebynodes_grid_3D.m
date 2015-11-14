%% 3D Chebyshev grid

% Calculates the [X,Y,Z] grid obtained by the mesh of the vectors vx, vy
% vz.


function [X,Y,Z] = chebynodes_grid_3D (a1, b1, n1, a2, b2, n2, a3, b3, n3)

xgv = chebynodes(a1,b1,n1);
ygv = chebynodes(a2,b2,n2);
zgv = chebynodes(a3,b3,n3);

[X, Y, Z ] = meshgrid(xgv,ygv,zgv);

end