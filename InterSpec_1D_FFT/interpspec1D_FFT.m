%% 1D Spectral interpolation using FFT
% n: number of Chebyshev nodes
% a: intervall [a,b]
% b: intervall [a,b]
% f: function to be interpolated, forme f @(x)

function [coefficients] = interpspec1D_FFT (n, a, b, f)

% Calculation of Chebyshev nodes
cheby_nodes = chebynodes(a,b,n);

% Calculation of the value of f on Chebyshev nodes
fcheby = f(cheby_nodes);

% Calculation of the coefficients using the FFT method
coefficients = coeff_fft(fcheby);

end