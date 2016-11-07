% Dado um vetor, faz a contagem de seus elementos e retorna aquele que
% possuem maior contagem (frequência)
function [mq] = mq(vetor)
    
    c = [];
    for i=1:size(vetor,1)
        a = vetor(i,1);

        adiciona = true;
        for k=1:size(c,1)
            if c(k,1) == a
                c(k,2) = c(k,2) + 1;
                adiciona = false;
                break;
            end
        end

        if adiciona
            c = [c; a, 1];
        end
    end
    
    maiorQuantidade = c(1,2);
    mq = c(1,1);
    
    for i=2:size(c,1)
        if c(i,2) > maiorQuantidade
            maiorQuantidade = c(i,2);
            mq = c(i,1);
        end
    end
end

