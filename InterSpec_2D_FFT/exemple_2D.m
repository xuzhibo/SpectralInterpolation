%% MAIN - SPECTRAL INTERPOLATION - FFT - 2D

% This script evaluates a function f = @(x,y) on the grid [T1,T2] for the
% points defined by t1,t2.

clc;
clear vars;

%% Parameters

% Definition of the function to be interpolated
f = @(x,y) x + y ;

% Axis 1
n1 = 13;
a1 = -5;
b1 = 5;
delta1 = .01;

% Axis 2
n2 = 5;
a2 = -3;
b2 = 3;
delta2 = .5;

% Grid to be interpolated
t1 = a1:delta1:b1;
t2 = a2:delta2:b2;
[T1, T2] = meshgrid(t1,t2);

%% PART ONE - INTERPOLATION AND EVALUATION

% Step one : interpolation of the function.
display('Coefficients calculation ...');
[coefficients] = interpspec2D_FFT(n1,a1,b1,n2,a2,b2,f);

% Step two : Evaluation of the interpolated function on the vector t.
display('Evaluation of the function...');
f_interp = zeros(length(t2),length(t1));
for j=1:length(t2)
    for i=1:length(t1)
        f_interp(j,i) = eval_func_2D(coefficients,T1(j,i),T2(j,i),n1,a1,b1,n2,a2,b2);
    end
end

%% PART TWO - OPTIONAL
% Evaluation of f on the Chebyshev nodes.

[X,Y] = chebynodes_grid(a1,b1,n1,a2,b2,n2);
fcheby = f(X,Y);

% Evaluation of f on the grid [T1,T2].
f_t=f(T1,T2);

% We now want to compare our interpolated function with the original function.

figure(1)
mesh (Y,X,fcheby);

figure(2)
mesh (T2,T1,f_t);

figure(3)
mesh (T2,T1,f_interp);

%% PART THREE - INTERPOLATION ERROR

display('Interpolation error')
erreur = sum(sum((abs(f_t - f_interp))));
fprintf('Error %f% =', erreur);

