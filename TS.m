function [U,V,X_,error]=TS(X,A,IterNum,r)
%% Simplified Alternating Minimization for tensor sensing
% Problem state��min|| b - <A,(U * V)> ||_F^2, s.t.:tubal-rank of U * V=r
% Input:X = U * V - �������ݣ�U:m * r * k,   V:r * n * k��     X��m * n * k
%       A - ����tensor��ÿһ��ǰ����A_i��СΪmk * nk,ÿһ��A_i��X���ڻ������õ�����Ϊy_i��  1 <= i<= k    
%       IterNum - �㷨��������
%       r - target tubal-rank
% Output��U^c - X^c������Ʒֽ��mk * rk
%         V^c - X^c���ҽ��Ʒֽ��rk * nk
%         X^c = U^c * V^c


X_c = Tensor2fullCircM(X);     %��tensor X ��Ϊѭ������   X: m * n * k  ->  X_c: mk * nk
error = zeros(IterNum,1);      %�������

%% ����y
y = dotProd(A,X_c);            % δȱʧ����X_c �����tensor����� y 

%% ��ʼ��U0
[m, n, k] = size(X);
U0 = randn(m, r, k);
U = Tensor2fullCircM(U0);     % U ��ʼ��ʱҲת��Ϊѭ������

%% �㷨��������
A2m = Tensor2Mat(A);          % A2mΪ���ź�Ĳ�������
A_t = tensorTubeTranspose(A);            
A_t2m = Tensor2Mat(A_t);      % A_t2mΪת�ú���ŵĲ�������
for l = 1 : IterNum
        V = LS_V(A2m, U, r*k, y, n*k);
        U = LS_U(A_t2m, V, r*k, y, m*k);
        X_ = U * V;
        RSE = norm(X_c(:) - X_(:)) / norm(X_c(:));
        fprintf('%d,error is %e\n',l,RSE);
        error(l,:) = RSE;    
end
%X_t=FullCircM2Tensor(X_,[10,10,10]);

%% LS����
function [V] = LS_V(A2m, U, r, y, n)
    U_ = mat2diaMat(U,n);               % ���ź�ľ��� U
    W = A2m*U_;                         
    V_= pinv(W' * W) * W' * y;          % �������
    V = Vec2Mat(V_,[r, n]);             % ���õ�������  V  ����ת��Ϊ����
end
    
function [U] = LS_U(A_t2m, V, r, y, m)
    Vt = V';
    Vt_ = mat2diaMat(Vt,m);
    W = A_t2m*Vt_;                      
    U_= pinv(W' * W )* W' * y;          
    U = (Vec2Mat(U_,[r, m]))';
end
end






