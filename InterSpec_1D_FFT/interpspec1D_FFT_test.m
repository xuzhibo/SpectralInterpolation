%% 1D Spectral interpolation using FFT
% n: number of Chebyshev nodes
% a: intervall [a,b]
% b: intervall [a,b]
% f: function to be interpolated, forme f @(x)

function [coefficients] = interpspec1D_FFT_test (value)

% Calculation of the coefficients using the FFT method
coefficients = coeff_fft(value);

end