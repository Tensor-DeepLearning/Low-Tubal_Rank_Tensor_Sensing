function SmallCircM = Tensor2SmallCircM(T)
%% 取出tesor的每一个tube，拉成竖的向量，放到对对应的位置，形成一个矩阵
% input: T : m * n * k
% output: T_s : mk * n
%已验证正确性

[m, n, k] = size(T);
SmallCircM = zeros(m * k, n);
for i = 1 : m
    for j = 1 : n
        SmallCircM( (i-1)*k + 1 : i * k, j) = T(i, j, :);
    end
end
end