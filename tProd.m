function [Z] = tProd(X, Y, needFFT)
%TPROD 3D tensor product;
% Input:
%   X - ��СΪ��m x r x k��tensor;
%   Y - ��СΪ��r x n x k��tensor;
% 
% Output:
%   Z - Z = X*Y,��СΪm x n x k;
% 
% EditDate: 2017/02/26
    if needFFT
        X = fft(X, [], 3);
        Y = fft(Y, [], 3);
    end
    
    szX = size(X);
    szY = size(Y);
    szZ = szX;
    szZ(2) = szY(2);
    Z = zeros(szZ);
    
    for i = 1 : szX(3)
        Z(:, :, i) = X(:, :, i) * Y(:, :, i);
    end
    
    Z = ifft(Z, [], 3);
end

