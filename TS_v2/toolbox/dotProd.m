function b = dotProd(A,X)
%% ����matrix sensing�еĹ۲�����b��Ŀ���ǲ����������ݱ��ں����������֤
% ���룺Ai - sensing matrix����СΪm*n,1 <= i <= k
%       X - ���ָ�����λ�þ��� ��СΪm*n 
% ����� <Ai,X>��Ϊbi��������b�Ĵ�СΪm*1
% author��Leon
% edit date��2017/4/27
sz=size(A);
b = zeros(sz(3),1);
for i = 1 : sz(3)
    a = A(:, :, i) .* X;
    c = sum(a(:));
    b(i,1) = c;
end
end

