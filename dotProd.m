function b = dotProd(A,X)
%% 计算tensor sensing中的观测向量y
% 输入：Ai - sensing matrix，大小为m*n,1 <= i <= k
%       X - 待恢复出的位置矩阵， 大小为m * n 
% 输出： <Ai,X>作为yi，向量y的大小为 k * 1

sz=size(A);
b = zeros(sz(3),1);
for i = 1 : sz(3)
    a = A(:, :, i) .* X;
    c = sum(a(:));
    b(i,1) = c;
end
end

