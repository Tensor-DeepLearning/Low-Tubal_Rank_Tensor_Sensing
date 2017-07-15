clc;clear all;close all;

%% 构造人工数据
 L = randn(10, 1, 10);
 R = randn(1, 10, 10);
 X = tProd(L, R, true);
[~, r ,~] = size(L);

%% 构造采样tensorA
[m, n, k] = size(X); 
A = zeros(m*k, n*k, m*k*n*k*0.2);  % 将每一个采样tensor A_i化为循环矩阵后，所有A_i^c叠起来化为一个tensor A. (m*k*n*k*0.2)为采样数量,0.2 为 20%采样率
sz = size(A);
d = 1;
while d< sz(3)+1         %采样数量              
    B = randn(m, n, k);
    B_c = Tensor2fullCircM(B);     % 构造循环矩阵，赋给tensor A的每一个前切面
    A(:, :, d) = B_c;
    d = d+1;
end

[U,V,X_,error] = TS(X,A,15,r);    % 15为迭代次数，r为rank

%% 画误差曲线
plot(log10(error));
grid on;
title(['tensor:10x10x10', '  Rank:1' ' sampling rate:']);
xlabel('n-th iteration');  
ylabel('RSE in log-scale');






