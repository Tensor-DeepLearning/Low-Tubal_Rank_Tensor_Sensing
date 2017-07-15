function [T_t] = tensorTubeTranspose(T)
%% 对tensor的每一个前切面矩阵做转置
    szT = size(T);
    T_t = zeros(szT(2), szT(1), szT(3));
    
    for l = 1 : szT(3)
        T_t(:, :, l) = T( :, :, l)';
    end
end