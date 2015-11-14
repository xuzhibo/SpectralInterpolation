%% MAIN - SPECTRAL INTERPOLATION - FFT - 2D

% This script interpolates a function defined by random coefficients.

% It then proceeds to compare the original coefficients with the
% interpolated ones.

clc;
clear ALL;

%% Parameters

% Axis 1
n1 = 13;
a1 = -5;
b1 = 5;

% Axis 2
n2 = 8;
a2 = -3;
b2 = 3;

% Axis 3
n3 = 5;
a3 = -2;
b3 = 2;

%% PART ZERO - DEFINITION OF THE FUNCTION

% Definition of the function to be interpolated
coeff_sim = randn(n1,n2,n3);

% Chebyshev nodes vectors
tx = chebynodes(a1, b1, n1);
ty = chebynodes(a2, b2, n2);
tz = chebynodes(a3, b3, n3);

%% PART ONE - INTERPOLATION AND EVALUATION

display('Evaluation of the function...');
g_interp = eval_func_3D_grid(coeff_sim,tx,ty,tz,n1,n2,n3,a1,b1,a2,b2,a3,b3);

%% PART TWO - INTERPOLATION

display('Coefficients calculation ...');
[coefficients] = interpspec3D_FFT_test(n1,n2,n3,permute(g_interp,[2 1 3]));

%% PART THREE - COMPARISON OF COEFFICIENTS

display('Coefficients error...')
erreur = sum(sum(sum(abs(coefficients - coeff_sim))));
fprintf('Error = %f', erreur);

