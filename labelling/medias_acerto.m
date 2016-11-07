function [medias] = medias_acerto(iteracoes, N)
    medias = 0;
    for i=1:N
        medias = medias + iteracoes.(['i',int2str(i)]).('txs_acerto');
    end
    medias = medias / N;
end
