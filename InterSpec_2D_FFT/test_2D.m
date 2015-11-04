%% MAIN - SPECTRAL INTERPOLATION - FFT - 2D

% This script interpolates a function generated by random coefficients.

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
n2 = 5;
a2 = -3;
b2 = 3;

%% PART ZERO - DEFINITION OF THE FUNCTION

% Definition of the function to be interpolated
coeff_sim = randn(n2,n1);

% Grid to be interpolated
[X,Y] = chebynodes_grid (a1, b1, n1, a2, b2, n2);

%% PART ONE - INTERPOLATION AND EVALUATION

display('Evaluation of the function...');
f_interp = zeros(size(X,1),size(X,2));
for j=1:size(X,2)
    for i=1:size(X,1)
        f_interp(i,j) = eval_func_2D(coeff_sim,X(i,j),Y(i,j),n1,a1,b1,n2,a2,b2);
    end
end

%% PART TWO - INTERPOLATION

display('Coefficients calculation ...');
[coefficients] = interpspec2D_FFT_test(n1,n2,f_interp);

%% PART THREE - COMPARISON OF COEFFICIENTS

display('Coefficients error...')
erreur = sum(sum(abs(coefficients - coeff_sim)));
fprintf('Error = %f', erreur);

