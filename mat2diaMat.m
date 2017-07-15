function [blkDiagM] = mat2diaMat(X, k)
%% 将k个矩阵X排列在大矩阵的对角线上，得到块对角矩阵
% 输入： X - m * n
% 输出： diaX - km * kn

[m, n] = size(X);
blkDiagM  = zeros(m*k, n*k);
for i = 1 : k
    blkDiagM((i-1)*m+1 : i*m, (i-1)*n+1 : i*n) = X;
end
blkDiagM = sparse(blkDiagM);
end