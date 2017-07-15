function [blkDiagM] = mat2diaMat(X, k)
%% ��k������X�����ڴ����ĶԽ����ϣ��õ���ԽǾ���
% ���룺 X - m * n
% ����� diaX - km * kn

[m, n] = size(X);
blkDiagM  = zeros(m*k, n*k);
for i = 1 : k
    blkDiagM((i-1)*m+1 : i*m, (i-1)*n+1 : i*n) = X;
end
blkDiagM = sparse(blkDiagM);
end