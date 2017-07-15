function M = Vec2Mat(v, sz)
%% 将向量重新还原为矩阵  
    M = zeros(sz);
    
    for i = 1 : sz(2)
        M(:, i) = v((i-1)*sz(1)+1 : i*sz(1));
    end
%     M = M';
end