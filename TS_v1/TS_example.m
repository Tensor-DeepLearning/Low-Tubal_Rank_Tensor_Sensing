clc;clear all;close all;

%% �����˹�����
 L = randn(10, 1, 10);
 R = randn(1, 10, 10);
 X = tProd(L, R, true);
[~, r ,~] = size(L);

%% �������tensorA
[m, n, k] = size(X); 
A = zeros(m*k, n*k, m*k*n*k*0.2);  % ��ÿһ������tensor A_i��Ϊѭ�����������A_i^c��������Ϊһ��tensor A. (m*k*n*k*0.2)Ϊ��������,0.2 Ϊ 20%������
sz = size(A);
d = 1;
while d< sz(3)+1         %��������              
    B = randn(m, n, k);
    B_c = Tensor2fullCircM(B);     % ����ѭ�����󣬸���tensor A��ÿһ��ǰ����
    A(:, :, d) = B_c;
    d = d+1;
end

[U,V,X_,error] = TS(X,A,15,r);    % 15Ϊ����������rΪrank

%% ���������
plot(log10(error));
grid on;
title(['tensor:10x10x10', '  Rank:1' ' sampling rate:']);
xlabel('n-th iteration');  
ylabel('RSE in log-scale');






