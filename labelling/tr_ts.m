%% Esta função retorna a um conjunto de treinamento e um conjunto de testes,
 % dada um conjunto de dados.

function [treinamento, teste] = tr_ts(dados, TX_TREINAMENTO)

    % quantidade de elementos para treinamento (tr) e teste (ts)
    tr = floor(TX_TREINAMENTO * size(dados, 1));
    ts = size(dados, 1) - tr;
    
    % embaralha os dados
    for i=1:floor(size(dados,1)/2)
        aleatorio1 = round(size(dados,1) + (1-size(dados,1)).*rand());
        aleatorio2 = round(size(dados,1) + (1-size(dados,1)).*rand());
        temp = dados(aleatorio1, :);
        dados(aleatorio1, :) = dados(aleatorio2, :);
        dados(aleatorio2, :) = temp;
    end
    
    treinamento = dados(1:tr,:);
    teste = dados(tr+1:tr+ts,:);

end
