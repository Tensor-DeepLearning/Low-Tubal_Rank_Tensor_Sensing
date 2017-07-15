%% ��֤�����Ƿ���ȷ
clc;clear all;close all;

 L = randn(10, 1, 10);
 R = randn(1, 10, 10);
 X = tProd(L, R, true);
%% �������tensorA
[m, n, k] = size(X);
A = zeros(m*k, n, m*k*n*0.5);   % ÿһ��tensor Ai��Ϊ���������Ai^s��Ϊһ��tensor
sz_A = size(A);
d = 1;
while d< sz_A(3)+1
    B = randn(m, n, k);
    B_s = Tensor2SmallCircM(B);  %ȡÿ��Сѭ������ĵ�һ�� 
%     B_s = randn(m*k, n);
    A(:, :, d) = B_s;
    d = d+1;
end

X_s = Tensor2SmallCircM(X);
%% ����õ�ԭʼ��b
b = dotProd(A, X_s);

%% ����
A2m = Tensor2Mat(A);
U1 = Tensor2fullCircM(L);
U1_ = mat2diaMat(U1,n);
V1 = Tensor2SmallCircM(R);
V1_ = Mat2Vec(V1);

%% ת�ú����
A_t = tensorTubeTranspose(A);
A_t2m = Tensor2Mat(A_t);
V2 =(Tensor2SmallCircM(R))';
V2_ = mat2diaMat(V2,m*k);
U2 = (Tensor2fullCircM(L))';
U2_ = Mat2Vec(U2);

%% ���ź������b
b1 = A2m * U1_ * V1_;
b2 = A_t2m * V2_ * U2_;

%% ���
rse1 = norm(b(:)-b1(:))/norm(b(:));
rse2 = norm(b(:)-b2(:))/norm(b(:)); 