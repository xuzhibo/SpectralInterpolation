%% Evaluation of a 3D function at the point (x,y,z)

% To use with the coefficients obtained after running interspec3_FFT.

function point = eval_func_3D_vec (coefficients,x,y,z,a1,b1,a2,b2,a3,b3)

n1 = size(coefficients,1);
n2 = size(coefficients,2);
n3 = size(coefficients,3);

A = zeros(n1,length(x));

chebypoly_x = chebypoly(x,a1,b1,n1);
chebypoly_y = chebypoly(y,a2,b2,n2);
chebypoly_z = chebypoly(z,a3,b3,n3);

for j = 1:n1
    
    C2 = squeeze(coefficients(j,:,:)) * chebypoly_z;
    B2 = C2 .* chebypoly_y;
    
    A(j,:) = sum(B2,1) .* chebypoly_x(j,:);
    
end

point = sum(A,1);


end