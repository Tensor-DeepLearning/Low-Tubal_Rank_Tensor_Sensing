function fullBlkCircM = Tensor2fullCircM(T)
%% ��tensorת��Ϊѭ������
% ���룺T��m * n * k
% �����T^c: mk * nk
    [m, n, k] = size(T);
    %diagM = sparse(diag(1:k));    
    diagM = (diag(1:k));
    fullBlkCircM = repmat(diagM, m, n);
    
    for i = 1 : n
        for j = 1 : m
            fullBlkCircM((j-1)*k+1 : j*k, (i-1)*k+1 : i*k) = Vec2Circ(T(j, i, :)) ;
        end
    end
end