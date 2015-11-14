%% MAIN - SPECTRAL INTERPOLATION - FFT - 3D

% This script evaluates a function g = @(x,y,z) on a 3D grid
% coordinates [TX,TY,TZ] for the points defined by tx,ty,tz.

clear vars
clc

%% Parameters

% Function to be interpolated
g = @(x,y,z) max(x,y) + z;

% Axe 1
n1 = 6;
a1 = -5;
b1 = 5;
delta1 = 0.5;

% Axe 2
n2 = 7;
a2 = -4;
b2 = 4;
delta2 = 0.5;

% Axe 3
n3 = 8;
a3 = -3;
b3 = 3;
delta3 = 0.5;

% Evaluation vectors
tx = a1:delta1:b1;
ty = a2:delta2:b2;
tz = a3:delta3:b3;

%% PART ONE - INTERPOLATION AND EVALUATION

% Step one : interpolation of the function.
[coeff] = interpspec3D_FFT(n1,a1,b1,n2,a2,b2,n3,a3,b3,g);

% Step two : Evaluation of the interpolated function on the vector t.
display('Evaluation of the function...');
g_interp = eval_func_3D_grid(coeff,tx,ty,tz,n1,n2,n3,a1,b1,a2,b2,a3,b3);

%% PART TWO - OPTIONAL

% Evaluation de la fonction sur les points de Chebyshev
[X,Y,Z] = chebynodes_grid_3D(a2,b2,n2,a1,b1,n1,a3,b3,n3);
gcheby = g(X,Y,Z);

% Evaluation de la fonction sur les points désirés
[TY,TX,TZ] = meshgrid (tx,ty,tz);
g_grid = g(TX,TY,TZ);

% We now want to compare our interpolated function with the original function.

figure(1)
mesh(X(:,:,1),Y(:,:,1),gcheby(:,:,1));

figure(2)
mesh(TX(:,:,1),TY(:,:,1),g_grid(:,:,1));

figure(3)
mesh(TX(:,:,1),TY(:,:,1),g_interp(:,:,1));

%% PART THREE - INTERPOLATION ERROR

display('Erreur dinterpolation')
erreur = sum(sum(sum(abs(g_interp - g_grid))));
fprintf('Error = %f', erreur);


