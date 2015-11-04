%% MAIN - SPECTRAL INTERPOLATION - FFT - 3D

% This script evaluates a function g = @(x,y,z) on a vector of 3D
% coordinates t for the points defined by tx,ty,tz.

clear vars
clc

%% Parameters

% Function to be interpolated
g = @(x,y,z) max(x,y) + z;

% Axis 1
n1 = 6;
a1 = -5;
b1 = 5;

% Axis 2
n2 = 7;
a2 = -4;
b2 = 4;

% Axis 3
n3 = 8;
a3 = -3;
b3 = 3;

% 3D coordinates of the vector to be evaluated
tx = ( -5:0.5:5);
ty = zeros(1,length(tx));
tz = ty;

%% PART ONE - INTERPOLATION AND EVALUATION

% Step one : interpolation of the function.
display('Coefficients calculation ...');
[coeff] = interpspec3D_FFT(n1,a1,b1,n2,a2,b2,n3,a3,b3,g);

% Step two : Evaluation of the interpolated function on the vector t.
display('Evaluation of the function...');
g_interp = eval_func_3D_vec(coeff,tx,ty,tz,n1,n2,n3,a1,b1,a2,b2,a3,b3);

%% PART TWO - OPTIONAL

% Evaluation of f on the vector [tx,ty,tz].
g_t=g(tx,ty,tz);

% We now want to compare our interpolated function with the original 
% function.
figure(1)
plot(tx,g_t);

figure(2)
plot(tx,g_interp);

%% PART THREE - INTERPOLATION ERROR

display('Interpolation error')
erreur = sum(abs(g_t - g_interp));
fprintf('Error %f% =', erreur);

