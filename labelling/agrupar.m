function [clusters, C] = agrupar(DS, attrs)

    clusters = [];
    
    C = length(unique(DS(:,end:end)', 'stable'));
    
    % cria os clusters e listas de elementos
    for i=1:C
        clusters.(['c', int2str(i)]).('elementos') = [];
    end
    
    % atribui cada instancia a seu respectivo cluster
    for i=1:size(DS,1)
        clusters.(['c', int2str( DS(i,size(DS,2)) + 1 )]).('elementos') = [clusters.(['c', int2str( DS(i,size(DS,2)) + 1 )]).('elementos'); DS(i, :)];
    end
    
    clusters.('atributos') = attrs;
    

end
