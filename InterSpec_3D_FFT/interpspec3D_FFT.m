%% 3D Spectral interpolation using FFT
% n1,n2,n3: number of Chebyshev nodes
% a1,a2,a3: intervall [a1,b1], [a2,b2], [a3,b3]
% b1,b2,a3: intervall [a1,b1], [a2,b2], [a3, b3]
% f: function to be interpolated, forme f @(x,y,z)

function [ coefficients_j_k_l] = interpspec3D_FFT(n1,a1,b1,n2,a2,b2,n3,a3,b3,h)

[X,Y,Z] = chebynodes_grid_3D(a2,b2,n2,a1,b1,n1,a3,b3,n3);

hcheby_3D = h(X,Y,Z);

coefficients = zeros(n1,n2,n3);
coefficients_j_k = zeros(n1,n2,n3);
coefficients_j_k_l = zeros(n1,n2,n3);

% We fix the third dimension. For each plane, we are going to do 2D
% interpolation.

for l=1:n3
    
    hcheby_2D = hcheby_3D(:,:,l);
    
    % First dimension - coefficients for (k)
    
    for j=1:n1
        
        coefficients(j,:,l) = coeff_fft(hcheby_2D(j,:));
        
    end

    % Second dimension - coefficients for (k,l)

    for k=1:n2
        
        coefficients_j_k(:,k,l)= coeff_fft(coefficients(:,k,l)');        
        
    end   
    
end

% We then interpolate on the third dimension by fixing the two others.

for k=1:n2
    for j=1:n1
        
        coeff_temp = permute(coefficients_j_k(j,k,:),[3 2 1]);
        coefficients_j_k_l(j,k,:) = coeff_fft(coeff_temp');
        
    end
end

end
