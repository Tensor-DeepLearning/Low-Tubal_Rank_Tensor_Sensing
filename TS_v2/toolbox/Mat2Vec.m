function b = Mat2Vec(A)
%�Ѿ����ÿһ���ó�����ת�ã����һ��nk*1������
    [m, n] = size(A);
    b = zeros(m*n, 1);
    for i = 1 : n
        b((i-1)*m+1 : i*m) = A(:, i);
    end
end