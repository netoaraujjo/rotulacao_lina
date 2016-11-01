function [] = rotular(clusters, C, diferenca, tipo, BDQ, medias, nFaixas)

    switch tipo
        case 1
            for i=1:C
                disp('_____________________________________________________________________________');
                disp(['Cluster ' num2str(i)]);

                [maiores, index] = sort(clusters.(['c',int2str(i)]).('txs_acerto'));

                elementos = clusters.(['c',int2str(i)]).('elementos')(:,1);
                
                e = [];
                for j=1:size(elementos,1);
                    for k=1:size(BDQ,1)
                        if elementos(j,1) == BDQ(k,1)
                            e = [e; BDQ(k,2:size(BDQ,2))];
                        end
                    end
                end
                
                [a,b] = decodificar(medias, index(end), mq(e(:,index(end))), nFaixas);
                disp(['      - Atributo: ' clusters.('atributos'){index(end)} ' - ' num2str(maiores(end)) '% | ' num2str(a) ' ~ ' num2str(b)]);
                for j=1:(length(maiores)-1)
                    if (maiores(end) - maiores(j)) <= diferenca
                        [a,b] = decodificar(medias, index(j), mq(e(:,index(j))), nFaixas);
                        disp(['      - Atributo: ' clusters.('atributos'){index(j)} ' - ' num2str(maiores(j)) '% | ' num2str(a) ' ~ ' num2str(b)]);
                    end
                end

            end
            
        case 2
            for i=1:C
                disp('_____________________________________________________________________________');
                disp(['Cluster ' num2str(i)]);
                
                [maiores, index] = sort(clusters.(['c',int2str(i)]).('txs_acerto'));

                elementos = clusters.(['c',int2str(i)]).('elementos')(:,1);
                e = clusters.(['c',int2str(i)]).('elementos')(:,2:size(clusters.(['c',int2str(i)]).('elementos'), 2));
    
                disp(['      - Atributo: ' clusters.('atributos'){index(end)} ' - ' num2str(maiores(end)) '% | ' num2str(mq(e(:,index(end))))]);
                for j=1:(length(maiores)-1)
                    if (maiores(end) - maiores(j)) <= diferenca
                        disp(['      - Atributo: ' clusters.('atributos'){index(j)} ' - ' num2str(maiores(j)) '% | ' num2str(mq(e(:,index(j))))]);
                    end
                end
            end
            
        otherwise
            disp('* Tipo de rotulação inválida!');
    end
end
