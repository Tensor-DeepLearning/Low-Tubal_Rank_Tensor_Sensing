clc;clear all;close all;
%% �����˹�����
 L = randn(10, 1, 10);
 R = randn(1, 10, 10);
 X = tProd(L, R, true);
 [~, r ,~] = size(L);
 
%% �������tensorA
[m, n, k] = size(X);
A = zeros(m*k, n, m*k*n*0.5);   % ��ÿһ������tensor A_i��Ϊ���������A_i^s��������Ϊһ��tensor. m*k*n*0.5Ϊ��������,0.5Ϊ50%����
% A = randn(m*k, n, m*k*n*1);
sz_A = size(A);
d = 1;
while d< sz_A(3)+1          %�������� 
    B = randn(m, n, k);
    B_s = Tensor2SmallCircM(B);  % ȡÿ��ѭ�������һ�У�����������󣬸�tensor A��ÿһ��ǰ����
    A(:, :, d) = B_s;
    d = d+1;
end

[U,V,X_,error] = TS(X,A,10,r);     % 10Ϊ����������rΪrank

%% ���������
plot(log10(error));
grid on;
title(['tensor:', '  Rank:' ' sampling rate:']);
xlabel('n-th iteration');  
ylabel('RSE in log-scale');






