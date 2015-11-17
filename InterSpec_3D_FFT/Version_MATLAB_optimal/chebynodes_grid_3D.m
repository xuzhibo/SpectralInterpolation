%% 3D Chebyshev grid

% Calculates the [X,Y,Z] grid obtained by the mesh of the vectors vx, vy
% vz.


function [Xr,Xc,Xp] = chebynodes_grid_3D (ar,br,nr,ac,bc,nc,ap,bp,np)

xrv = chebynodes(ar,br,nr);
xcv = chebynodes(ac,bc,nc);
xpv = chebynodes(ap,bp,np);

[Xr,Xc,Xp] = meshgrid(xrv,xcv,xpv);

end