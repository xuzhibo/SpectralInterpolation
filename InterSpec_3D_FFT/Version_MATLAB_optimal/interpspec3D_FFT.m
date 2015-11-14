%% 3D Spectral interpolation using FFT
% n1,n2,n3: number of Chebyshev nodes
% a1,a2,a3: intervall [a1,b1], [a2,b2], [a3,b3]
% b1,b2,a3: intervall [a1,b1], [a2,b2], [a3, b3]
% f: function to be interpolated, forme f @(x,y,z)

function [ coefficients_j_k_l] = interpspec3D_FFT(hcheby_3D)

nr = size(hcheby_3D,1);
nc = size(hcheby_3D,2);
np = size(hcheby_3D,3);

coefficients = zeros(nr,nc,np);
coefficients_j_k = zeros(nr,nc,np);
coefficients_j_k_l = zeros(nr,nc,np);

% We fix the third dimension. For each plane, we are going to do 2D
% interpolation.

for l=1:np
    
    hcheby_2D = hcheby_3D(:,:,l);
    
    % First dimension - coefficients for (k)

     for j=1:nr
        
      %  coefficients(j,:,l) = coeff_fft(hcheby_2D(j,:));
        
    end
    
   coefficients(:,:,l) = coeff_fft(hcheby_2D);
    
    % Second dimension - coefficients for (k,l)
    for k=1:nc
        
      %  coefficients_j_k(:,k,l)= coeff_fft(coefficients(:,k,l)');        
        
    end   
    
           coefficients_j_k(:,:,l) = coeff_fft(coefficients(:,:,l)')';

    
end

% We then interpolate on the third dimension by fixing the two others.
for k=1:nc
    for j=1:nr
        
        coeff_temp = permute(coefficients_j_k(j,k,:),[3 2 1]);
        coefficients_j_k_l(j,k,:) = coeff_fft(coeff_temp');
        
    end
end

end
