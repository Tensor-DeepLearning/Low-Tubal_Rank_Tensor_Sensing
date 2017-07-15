function [circM] = Vec2Circ(v)
%% 向量生成循环矩阵;
    len = length(v);
    circM = zeros(len, len);
    
    for i = 1 : len
        circM(i, i : len) = v(1 : len-i+1);
        circM(i, 1 : i-1) = v(len-i+2 : len);
    end
    circM = circM';
end
