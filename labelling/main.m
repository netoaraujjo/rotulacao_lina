clear; close all; clc;


%% Base de Dados %%
% DS = Data set
[DS, ATTRS] = carregar_dt('clustered_iris');




%% Analise do data_set
%analisar_bd(DS(1:end, 1:end -1));




%% Numero de Medias de Execucoes %%
N = 3; % numero de iteracoes por atributo
disp(['# Medias de Redes Neurais: ' num2str(N)]);

tic




%% Discretizacao %%
tipo = 1; % Dados:
          % 1 - Continuo
          % 2 - Discreto / Categorico
nFaixas = 5;
if tipo == 1
    [BDQ, faixas] = discretizar(DS(:, 1:end-1), 'EFD', nFaixas);
    
    % Histograma de todos os atributos (global)
    hist(BDQ(:,2:size(BDQ, 2)), nFaixas);
    title('Histograma');
    hold on
    Y = floor((size(BDQ, 1) / nFaixas));
    for i=1:nFaixas
        Y = [Y, floor((size(BDQ, 1) / nFaixas))];
    end
    
    plot(Y);
else
    faixas = -1;
    BDQ = DS(:, 1:end-1);
end




%% Clusterizacao
[clusters, C] = agrupar(DS, ATTRS);




%% Rede Neural
for i=1:C    
    cluster = clusters.(['c',int2str(i)]).('elementos');
    cluster = cluster(:, 1:end-1);
    
    %% Calcular Coeficiente de Correlacao %%
    clusters.atributos
    disp(['# Correlacao Cluster: ' num2str(i)]);
    corr(cluster(:,2:size(cluster,2)))
    
    for n=1:N
        [treinamento, teste] = tr_ts(cluster, 0.6);
        if tipo == 1
            [treinamentoQ, testeQ] = trQ_tsQ(treinamento, teste, BDQ);
        end
        iteracoes.(['c',int2str(i)]).(['i',int2str(n)]).('txs_acerto') = [];
        % exceto a primeira coluna (index)
        for j=2:size(cluster, 2)
            if tipo == 1
                [obtido, desejado, net] = treinarQ('rna', j, treinamentoQ, testeQ, nFaixas);
            else
                [obtido, desejado, net] = treinar('rna', j, treinamento, teste);
            end
            iteracoes.(['c',int2str(i)]).(['i',int2str(n)]).('txs_acerto') = [iteracoes.(['c',int2str(i)]).(['i',int2str(n)]).('txs_acerto') taxa_acerto(obtido, desejado)];
            iteracoes.(['c',int2str(i)]).(['i',int2str(n)]).(['rna',int2str(j-1)]) = net;
        end
    end
    
    clusters.(['c',int2str(i)]).('txs_acerto') = medias_acerto(iteracoes.(['c',int2str(i)]), N);
end




%% Rotulacao
diferenca = 15;
rotular(clusters, C, diferenca, tipo, BDQ, faixas, nFaixas);

t = toc;
disp('_____________________________________________________________________________');
disp(['Tempo de execucao: ' num2str(t) ' segundos.']);

calcular_resultados(clusters, C, diferenca, BDQ, faixas, tipo, nFaixas);