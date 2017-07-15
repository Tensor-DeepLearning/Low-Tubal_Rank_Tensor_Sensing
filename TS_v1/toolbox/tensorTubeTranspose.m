function [T_t] = tensorTubeTranspose(T)
%% ��tensor��ÿһ��ǰ���������ת��
    szT = size(T);
    T_t = zeros(szT(2), szT(1), szT(3));
    
    for l = 1 : szT(3)
        T_t(:, :, l) = T( :, :, l)';
    end
end