function b = Mat2Vec(A)
%把矩阵的每一列拿出来，转置，组成一个nk*1的向量
    [m, n] = size(A);
    b = zeros(m*n, 1);
    for i = 1 : n
        b((i-1)*m+1 : i*m) = A(:, i);
    end
end