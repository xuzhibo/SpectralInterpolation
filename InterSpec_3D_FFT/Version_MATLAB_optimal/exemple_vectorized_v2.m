%% MAIN - SPECTRAL INTERPOLATION - FFT - 3D

% This script evaluates a function g = @(x,y,z) on a vector of 3D
% coordinates t for the points defined by tx,ty,tz.

clear all
clc

%% Parameters

% Function to be interpolated
g = @(x,y,z) max(y,0)+2*x-z.^2;

% Axis - rows
nr = 50;
ar = 0;
br = 50;

% Axis - columns
nc = 10;
ac = -4;
bc = 4;

% Axis - planes
np = 5;
ap = -3;
bp = 3;

% % 3D coordinates of the vector to be evaluated

tr = 0:0.5:3;
tc = 0:0.5:3;
tp  = 0:0.5:3;

%% PART ONE - INTERPOLATION AND EVALUATION

% Editor's note : this is a voluntary inversion between the rows and the
% columns. Please use this code as instructed :)

[Xr,Xc,Xp] = chebynodes_grid_3D(ac,bc,nc,ar,br,nr,ap,bp,np);
hcheby_3D = g(Xr,Xc,Xp);

% Step one : interpolation of the function.
display('Coefficients calculation ...');

tic;
[coeff] = interpspec3D_FFT_vec(hcheby_3D);
toc;

% Step two : Evaluation of the interpolated function on the vector t.
display('Evaluation of the function...');
g_interp = eval_func_3D_vec(coeff,tr,tc,tp,ar,br,ac,bc,ap,bp);

%% PART TWO - OPTIONAL

% Evaluation of f on the vector [tx,ty,tz].
g_t=g(tr,tc,tp);

% We now want to compare our interpolated function with the original 
% function.
figure(1)
hold on

plot(tr,g_t,'bl');
plot(tr,g_interp,'r--*');

hold off

%% PART THREE - INTERPOLATION ERROR

display('Interpolation error')
erreur = sum(abs(g_t - g_interp));
fprintf('Error %f% =', erreur);

