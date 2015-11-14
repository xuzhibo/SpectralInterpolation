%% MAIN - SPECTRAL INTERPOLATION - FFT - 3D

% This script evaluates a function g = @(x,y,z) on a vector of 3D
% coordinates t for the points defined by tx,ty,tz.

clear all
clc

%% Parameters

% Function to be interpolated
g = @(x,y,z) max(x-1,0);

% Axis - columns
nr = 50;
ar = -5;
br = 5;

% Axis - rows
nc = 25;
ac = -4;
bc = 4;

% Axis - planes
np = 5;
ap = -3;
bp = 3;

% 3D coordinates of the vector to be evaluated
tr = ( -5:0.5:5);
tc = zeros(1,length(tr));
tp = tr;

%% PART ONE - INTERPOLATION AND EVALUATION

[Xr,Xc,Xp] = chebynodes_grid_3D(ar,br,nr,ac,bc,nc,ap,bp,np);
hcheby_3D = g(Xr,Xc,Xp);

% Step one : interpolation of the function.
display('Coefficients calculation ...');
tic;
[coeff1] = interpspec3D_FFT(hcheby_3D);
toc;

tic;
[coeff2] = interpspec3D_FFT_vec(hcheby_3D);
toc;
% Step two : Evaluation of the interpolated function on the vector t.
display('Evaluation of the function...');
g_interp = eval_func_3D_vec(coeff1,tr,tc,tp,ar,br,ac,bc,ap,bp);
g_interp2 = eval_func_3D_vec(coeff2,tr,tc,tp,ar,br,ac,bc,ap,bp);


%% PART TWO - OPTIONAL

% Evaluation of f on the vector [tx,ty,tz].
g_t=g(tr,tc,tp);

% We now want to compare our interpolated function with the original 
% function.
hold on
% figure(1)
plot(tr,g_t,'bl');

% figure(2)
plot(tr,g_interp,'g--*');

% figure(3)
plot(tr,g_interp2,'r');
hold off

%% PART THREE - INTERPOLATION ERROR

display('Interpolation error')
erreur = sum(abs(g_t - g_interp));
fprintf('Error %f% =', erreur);

