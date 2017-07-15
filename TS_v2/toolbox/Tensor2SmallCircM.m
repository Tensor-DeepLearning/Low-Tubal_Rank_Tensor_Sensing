function SmallCircM = Tensor2SmallCircM(T)
%% ȡ��tesor��ÿһ��tube�����������������ŵ��Զ�Ӧ��λ�ã��γ�һ������
% input: T : m * n * k
% output: T_s : mk * n
%����֤��ȷ��

[m, n, k] = size(T);
SmallCircM = zeros(m * k, n);
for i = 1 : m
    for j = 1 : n
        SmallCircM( (i-1)*k + 1 : i * k, j) = T(i, j, :);
    end
end
end