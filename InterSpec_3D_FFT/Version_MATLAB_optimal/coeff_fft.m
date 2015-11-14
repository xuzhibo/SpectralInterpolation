% Calculation of Chebyshev coefficients using the FFT method

function coefficients = coeff_fft (value)

N = size(value,2) - 1 ;

coeff = real(fft([value'; value(:,N:-1:2)']))';
coefficients = [coeff(:,1)/(2*N) coeff(:,2:N)/N coeff(:,N+1)/(2*N)];

end
