clear; close all; clc;


%% Base de Dados %%
% DB = Base de dados
% C  = número de clusters previamente indicado para a base de dados
base_dados = 'glass';
[BD, C] = carregar_bd(base_dados);

%% Análise do Banco de Dados
analisar_bd(BD);

%% Número de Médias de Execuções %%
N = 3; % número de iterações por atributo
disp(['# Médias de Redes Neurais: ' num2str(N)]);

tic
%% Discretização %%
tipo = 1; % Dados:
          % 1 - Contínuo
          % 2 - Discreto / Categórico
nFaixas = 5;
if tipo == 1
    [BDQ, faixas] = discretizar(BD, 'EFD', nFaixas);
    
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
    BDQ = BD;
end

%% Clusterização %%
[clusters, BDC] = agrupar(['k-means ' base_dados], BD, C);
% [clusters, BDC] = agrupar([base_dados '-o'], BD, C); % Agrupamento ótimo
% [clusters, BDC] = agrupar_discretizado(['k-means ' base_dados], BD, BDQ, C); % Agrupamento com dados discretizados

%% Rede Neural %%
for i=1:C    
    cluster = clusters.(['c',int2str(i)]).('elementos');
    
    %% Calcular Coeficiente de Correlação %%
    clusters.atributos
    disp(['# Correlação Cluster: ' num2str(i)]);
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

%% Rotulação %%

diferenca = 15;
rotular(clusters, C, diferenca, tipo, BDQ, faixas, nFaixas);

t = toc;
disp('_____________________________________________________________________________');
disp(['Tempo de execução: ' num2str(t) ' segundos.']);


calcular_resultados(clusters, C, diferenca, BDQ, faixas, tipo, nFaixas);