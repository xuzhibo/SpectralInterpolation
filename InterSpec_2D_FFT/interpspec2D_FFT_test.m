%% 2D Spectral interpolation using FFT
% n1,n2: number of Chebyshev nodes
% a1,a2: intervall [a1,b1], [a2,b2]
% b1,b2: intervall [a1,b1], [a2,b2]
% f: function to be interpolated, forme f @(x,y)

function [coefficients] = interpspec2D_FFT_test (n1, n2, fcheby)

c = zeros(n2,n1);
coefficients = zeros(n2,n1);

% First dimension - coefficients for (k)
for k=1:n2

    c(k,:) = coeff_fft(fcheby(k,:));
    
end

% Second dimension - coefficients for (k,l)
for l=1:n1

    coefficients(:,l) = coeff_fft(c(:,l)');
        
end

end