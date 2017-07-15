function [U,V,X_,error]=TS(X,A,IterNum,r)
%% Simplified Alternating Minimization for tensor sensing
% Problem state：min|| b - <A,(U * V)> ||_F^2, s.t.:tubal-rank of U * V=r
% Input:X = U * V - 理想数据，U:m * r * k,   V:r * n * k，     X：m * n * k
%       A - 采样tensor，每一个前切面A_i大小为mk * nk,每一个A_i与X做内积，所得的数作为y_i，  1 <= i<= k    
%       IterNum - 算法迭代次数
%       r - target tubal-rank
% Output：U^c - X^c的左近似分解项，mk * rk
%         V^c - X^c的右近似分解项，rk * nk
%         X^c = U^c * V^c


X_c = Tensor2fullCircM(X);     %将tensor X 化为循环矩阵   X: m * n * k  ->  X_c: mk * nk
error = zeros(IterNum,1);      %误差数组

%% 计算y
y = dotProd(A,X_c);            % 未缺失数据X_c 与采样tensor计算出 y 

%% 初始化U0
[m, n, k] = size(X);
U0 = randn(m, r, k);
U = Tensor2fullCircM(U0);     % U 初始化时也转化为循环矩阵

%% 算法迭代主体
A2m = Tensor2Mat(A);          % A2m为编排后的采样矩阵
A_t = tensorTubeTranspose(A);            
A_t2m = Tensor2Mat(A_t);      % A_t2m为转置后编排的采样矩阵
for l = 1 : IterNum
        V = LS_V(A2m, U, r*k, y, n*k);
        U = LS_U(A_t2m, V, r*k, y, m*k);
        X_ = U * V;
        RSE = norm(X_c(:) - X_(:)) / norm(X_c(:));
        fprintf('%d,error is %e\n',l,RSE);
        error(l,:) = RSE;    
end
%X_t=FullCircM2Tensor(X_,[10,10,10]);

%% LS函数
function [V] = LS_V(A2m, U, r, y, n)
    U_ = mat2diaMat(U,n);               % 编排后的矩阵 U
    W = A2m*U_;                         
    V_= pinv(W' * W) * W' * y;          % 导数求解
    V = Vec2Mat(V_,[r, n]);             % 将得到的向量  V  重新转化为矩阵
end
    
function [U] = LS_U(A_t2m, V, r, y, m)
    Vt = V';
    Vt_ = mat2diaMat(Vt,m);
    W = A_t2m*Vt_;                      
    U_= pinv(W' * W )* W' * y;          
    U = (Vec2Mat(U_,[r, m]))';
end
end






