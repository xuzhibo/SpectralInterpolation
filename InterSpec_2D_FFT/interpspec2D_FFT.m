%% 2D Spectral interpolation using FFT
% n1,n2: number of Chebyshev nodes
% a1,a2: intervall [a1,b1], [a2,b2]
% b1,b2: intervall [a1,b1], [a2,b2]
% f: function to be interpolated, forme f @(x)

function [coefficients] = interpspec2D_FFT (n1,a1,b1,n2,a2,b2,f)

c = zeros(n2,n1);
coefficients = zeros(n2,n1);

% Chebyshev grid calculation
[X,Y] = chebynodes_grid(a1,b1,n1,a2,b2,n2);

% Evaluation of f on Chebyshev nodes
fcheby = f(X,Y);

% First dimension - coefficients for (k)
for k=1:n2

    c(k,:) = coeff_fft(fcheby(k,:));
    
end

% Second dimension - coefficients for (k,l)
for l=1:n1

    coefficients(:,l) = coeff_fft(c(:,l)');
        
end

end