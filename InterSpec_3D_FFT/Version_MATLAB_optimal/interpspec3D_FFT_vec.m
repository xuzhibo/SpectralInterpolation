%% 3D Spectral interpolation using FFT
% n1,n2,n3: number of Chebyshev nodes
% a1,a2,a3: intervall [a1,b1], [a2,b2], [a3,b3]
% b1,b2,a3: intervall [a1,b1], [a2,b2], [a3, b3]
% f: function to be interpolated, forme f @(x,y,z)

function [ coefficients_j_k_l] = interpspec3D_FFT_vec(array3D)

nr = size(array3D,1);
nc = size(array3D,2);
np = size(array3D,3);

coefficients_j_k = zeros(nr,nc,np);
coefficients_j_k_l = zeros(nr,nc,np);

% We fix the third dimension. For each plane, we are going to do 2D
% interpolation.

for l=1:np
    
    hcheby_2D = array3D(:,:,l);
    
    % First dimension - coefficients for (k)
    coefficients = coeff_fft(hcheby_2D);
    
    % Second dimension - coefficients for (k,l)
    coefficients_j_k(:,:,l) = coeff_fft(coefficients')';
    
end

% We then interpolate on the third dimension by fixing the two others.
for k=1:nc
    
    coeff_temp = squeeze(coefficients_j_k(:,k,:));
    coefficients_j_k_l(:,k,:) = coeff_fft(coeff_temp);
    
end

end
