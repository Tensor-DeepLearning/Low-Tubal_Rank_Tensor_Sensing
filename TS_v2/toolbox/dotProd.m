function b = dotProd(A,X)
%% 计算matrix sensing中的观测向量b，目的是产生理想数据便于后续结果的验证
% 输入：Ai - sensing matrix，大小为m*n,1 <= i <= k
%       X - 待恢复出的位置矩阵， 大小为m*n 
% 输出： <Ai,X>作为bi，则向量b的大小为m*1
% author：Leon
% edit date：2017/4/27
sz=size(A);
b = zeros(sz(3),1);
for i = 1 : sz(3)
    a = A(:, :, i) .* X;
    c = sum(a(:));
    b(i,1) = c;
end
end

