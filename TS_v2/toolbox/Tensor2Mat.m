function B = Tensor2Mat(A)
%% ��tensorA��ÿһ��ǰ�����������һ����������˳����Ϊ�¾����ÿһ�У�
% �ٽ��µõ��ľ���ת��
%���룺 tensor A - m * n * k
%����� matrix B - k * mn


[m, n, k]=size(A);
C = zeros(m*n, k);
for i = 1 : k
C(:, i) = Mat2Vec(A(:, :, i));
end
B = C';
end