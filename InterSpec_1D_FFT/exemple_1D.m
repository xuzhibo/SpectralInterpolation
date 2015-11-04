%% MAIN - SPECTRAL INTERPOLATION - FFT - 1D

% This script evaluates a function f = @(x) on the intervall [a,b] for the
%  points defined by t.

clc;
clear all

%% Parameters

% Definition of the function to be interpolated
f = @(x) sin(x);

% Number of Chebyshev nodes
n = 30;

% Intervall [a,b] 
a = -5; 
b = 5;

% Vector t 
delta = .01;
t = a:delta:b;

%% PART ONE - INTERPOLATION AND EVALUATION

%% Step one : interpolation of the function.
display('Coefficients calculation ...');
[coefficients] = interpspec1D_FFT(n,a,b,f);

%% Step two : Evaluation of the interpolated function on the vector t.
display('Evaluation of the function...');
chebypolys_on_intervall = chebypoly(t,a,b,n);
f_interp = coefficients * chebypolys_on_intervall;

%% PART TWO - OPTIONAL
% Evaluation of f on the Chebyshev nodes.
cheby_nodes = chebynodes(a,b,n);
fcheby = f(cheby_nodes);

% Evaluation of f on the vector t.
f_t=f(t);

% We now want to compare our interpolated function with the original function.
% Let's graph, in yellow, our original function evaluated on the vector t;
% in red, the interpolated function on the vector t; in stars, the function
% evaluated on the Chebyshev nodes.

%% Graph

hold on
plot(t,f_t,'y-o')
plot(t,f_interp,'r--')
plot(cheby_nodes,fcheby,'*')
hold off

%% PART THREE - INTERPOLATION ERROR
display('Interpolation error')
erreur = sum(abs(f_t - f_interp));
fprintf('Error %f% =', erreur);

