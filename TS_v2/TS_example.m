clc;clear all;close all;
%% 构造人工数据
 L = randn(10, 1, 10);
 R = randn(1, 10, 10);
 X = tProd(L, R, true);
 [~, r ,~] = size(L);
 
%% 构造采样tensorA
[m, n, k] = size(X);
A = zeros(m*k, n, m*k*n*0.5);   % 将每一个采样tensor A_i化为矩阵后，所有A_i^s叠起来化为一个tensor. m*k*n*0.5为采样数量,0.5为50%采样
% A = randn(m*k, n, m*k*n*1);
sz_A = size(A);
d = 1;
while d< sz_A(3)+1          %采样数量 
    B = randn(m, n, k);
    B_s = Tensor2SmallCircM(B);  % 取每个循环矩阵第一列，构造采样矩阵，给tensor A的每一个前切面
    A(:, :, d) = B_s;
    d = d+1;
end

[U,V,X_,error] = TS(X,A,10,r);     % 10为迭代次数，r为rank

%% 画误差曲线
plot(log10(error));
grid on;
title(['tensor:', '  Rank:' ' sampling rate:']);
xlabel('n-th iteration');  
ylabel('RSE in log-scale');






