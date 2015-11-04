%% Evaluation of a 3D function on a grid

% To use with the coefficients obtained after running interspec3_FFT.
% It will evaluates to the grid created by meshing t1,t2 and t3.

function h_interp = eval_func_3D_grid (coeff,t1,t2,t3,n1,n2,n3,a1,b1,a2,b2,a3,b3)

% Initialisation
h_interp = zeros(length(t1),length(t2),length(t3));

multi_x2 = zeros(length(t1)*n3,n2);
multi_y2 = zeros(length(t1)*length(t2), n3);
multi_z2 = zeros(length(t1)*length(t3), length(t2));

% On aplatit la matrice des coefficients
E = coeff(:,:);
F = E';

% Evaluation sur la première dimension
for ll = 0:(length(t1)-1)
    
    x = t1(ll+1);
    chebypoly_x = chebypoly(x,a1,b1,n1);
    
    multi_x = F * chebypoly_x;
    multi_x2((ll*n3+1):((ll+1)*n3),:) = reshape(multi_x, [n2 n3])';
    
end

% Evaluation sur la deuxième dimension
for kk=0:length(t2)-1
    
    y = t2(kk+1);
    chebypoly_y = chebypoly(y,a2,b2,n2);
    
    multi_y = multi_x2 * chebypoly_y;
    multi_y2((kk*length(t1)+1):((kk+1)*length(t1)),:) = reshape(multi_y, [n3 length(t1)])';
    
end

% Evaluation sur la troisième dimension
for jj=0:length(t3)-1
    
    z = t3(jj+1);
    chebypoly_z = chebypoly(z,a3,b3,n3);
    
    multi_z = multi_y2 * chebypoly_z;
    multi_z2((jj*length(t1)+1):((jj+1)*length(t1)),:) = reshape(multi_z, [length(t1) length(t2)]);
    
end

for a=0:1:length(t3)-1
   
    h_interp(:,:,(a+1)) = multi_z2((a*length(t1)+1):(a+1)*length(t1),:);
    
end

h_interp = permute(h_interp,[2 1 3]);
end