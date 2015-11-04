%% Evaluation of a 2D function at the point (x,y)

% To use with the coefficients obtained after running interspec2D_FFT.

function z = eval_func_2D(coefficients,x,y,n1,a1,b1,n2,a2,b2)

B = zeros(n2,1);

chebypoly_x = chebypoly(x,a1,b1,n1);
chebypoly_y = chebypoly(y,a2,b2,n2);

for k = 1:n2
    
    A = coefficients(k,:) * chebypoly_x;
    B(k) = sum(A) * chebypoly_y(k);
    
end

z = sum(B);

end




