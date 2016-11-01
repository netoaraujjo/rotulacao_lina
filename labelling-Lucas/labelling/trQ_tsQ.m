%% Esta função transforma o conjunto de treinamento e teste em
% conjuntos quantizados

function [treinamentoQ, testeQ] = trQ_tsQ(treinamento, teste, BDQ)

    treinamentoQ = [];
    for i=1:size(treinamento,1)
        for j=1:size(BDQ,1)
            if BDQ(j,1) == treinamento(i,1)
                treinamentoQ = [treinamentoQ; BDQ(j,:)];
                break;
            end
        end
    end
    
    testeQ = [];
    for i=1:size(teste,1)
        for j=1:size(BDQ,1)
            if BDQ(j,1) == teste(i,1)
                testeQ = [testeQ; BDQ(j,:)];
                break;
            end
        end
    end
end
