function B = Tensor2Mat(A)
%% 将tensorA的每一个前切面矩阵拉成一个向量，再顺序作为新矩阵的每一列，
% 再将新得到的矩阵转置
%输入： tensor A - m * n * k
%输出： matrix B - k * mn


[m, n, k]=size(A);
C = zeros(m*n, k);
for i = 1 : k
C(:, i) = Mat2Vec(A(:, :, i));
end
B = C';
end