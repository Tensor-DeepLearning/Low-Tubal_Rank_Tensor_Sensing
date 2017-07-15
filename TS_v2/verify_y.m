%% 验证编排是否正确
clc;clear all;close all;

 L = randn(10, 1, 10);
 R = randn(1, 10, 10);
 X = tProd(L, R, true);
%% 构造采样tensorA
[m, n, k] = size(X);
A = zeros(m*k, n, m*k*n*0.5);   % 每一个tensor Ai化为矩阵后，所有Ai^s化为一个tensor
sz_A = size(A);
d = 1;
while d< sz_A(3)+1
    B = randn(m, n, k);
    B_s = Tensor2SmallCircM(B);  %取每个小循环矩阵的第一列 
%     B_s = randn(m*k, n);
    A(:, :, d) = B_s;
    d = d+1;
end

X_s = Tensor2SmallCircM(X);
%% 计算得到原始的b
b = dotProd(A, X_s);

%% 编排
A2m = Tensor2Mat(A);
U1 = Tensor2fullCircM(L);
U1_ = mat2diaMat(U1,n);
V1 = Tensor2SmallCircM(R);
V1_ = Mat2Vec(V1);

%% 转置后编排
A_t = tensorTubeTranspose(A);
A_t2m = Tensor2Mat(A_t);
V2 =(Tensor2SmallCircM(R))';
V2_ = mat2diaMat(V2,m*k);
U2 = (Tensor2fullCircM(L))';
U2_ = Mat2Vec(U2);

%% 编排后求出的b
b1 = A2m * U1_ * V1_;
b2 = A_t2m * V2_ * U2_;

%% 误差
rse1 = norm(b(:)-b1(:))/norm(b(:));
rse2 = norm(b(:)-b2(:))/norm(b(:)); 