%% TEST - Coefficient verification - 1D - Spectral Interpolation

% This script evaluates a function defined by random coefficients
% on the intervall [a,b].

% We then proceed to verify that we have the same coefficients as the
% original function.

clc;
clear all;

%% Parameters

% Number of Chebyshev nodes
n = 30;

% Definition of the function to be interpolated
coeff_sim = randn(n,1);

% Intervall [a,b] 
a = -5; 
b = 5;

%% PART ONE - EVALUATION OF THE FONCTION TO BE INTERPOLATED

display('Evaluation of the function to be interpolated...');
chebyn = chebynodes(a,b,n);
chebypolys_on_intervall = chebypoly(chebyn,a,b,n);
f_interp = chebypolys_on_intervall * coeff_sim;

%% PART TWO - INTERPOLATION OF THE FUNCTION

display('Coefficients calculation ...');
[coefficients] = interpspec1D_FFT_test(f_interp');

%% PART THREE - VERIFICATION

display('Coefficients error...')
erreur = sum(abs(coefficients' - coeff_sim));
fprintf('Error = %f', erreur);

