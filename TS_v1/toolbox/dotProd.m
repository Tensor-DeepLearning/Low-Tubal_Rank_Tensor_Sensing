function b = dotProd(A,X)
%% ����tensor sensing�еĹ۲�����y
% ���룺Ai - sensing matrix����СΪm*n,1 <= i <= k
%       X - ���ָ�����λ�þ��� ��СΪm * n 
% ����� <Ai,X>��Ϊyi������y�Ĵ�СΪ k * 1

sz=size(A);
b = zeros(sz(3),1);
for i = 1 : sz(3)
    a = A(:, :, i) .* X;
    c = sum(a(:));
    b(i,1) = c;
end
end

