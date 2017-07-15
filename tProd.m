function [Z] = tProd(X, Y, needFFT)
%TPROD 3D tensor product;
% Input:
%   X - 大小为：m x r x k的tensor;
%   Y - 大小为：r x n x k的tensor;
% 
% Output:
%   Z - Z = X*Y,大小为m x n x k;
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

