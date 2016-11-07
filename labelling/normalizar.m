function [BD] = normalizar(BD)
    if size(BD,1) == 1
        media = BD(1,:)
    else
        media = mean(BD)
    end
    dp = std(BD,0,1)

    for i=1:size(BD,1)
        for j=1:size(BD,2)
            BD(i,j) = (BD(i,j) - media(1,j)) / dp(1,j);
        end
    end
end
