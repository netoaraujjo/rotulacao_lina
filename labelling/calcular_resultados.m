function [ R ] = calcular_resultados(clusters, C, diferenca, BDQ, medias, tipo, nFaixas)

    switch tipo

        case 1
            disp(' ');
            disp(' ');
            disp(' ');
            disp('###########################################################');
            disp('###################     RESULTADOS      ###################');
            disp('###########################################################');
            disp(' ');
            disp(' ');
            disp(' ');

            for i=1:C
                disp('_____________________________________________________________________________');
                disp(['Cluster ' num2str(i)]);

                [maiores, index] = sort(clusters.(['c',int2str(i)]).('txs_acerto'));

                elementos = clusters.(['c',int2str(i)]).('elementos')(:,1);
                elm = clusters.(['c',int2str(i)]).('elementos')(:,2:size(clusters.(['c',int2str(i)]).('elementos'),2));

                e = [];
                for j=1:size(elementos,1);
                    for k=1:size(BDQ,1)
                        if elementos(j,1) == BDQ(k,1)
                            e = [e; BDQ(k,2:size(BDQ,2))];
                        end
                    end
                end

                for j=1:(length(maiores))
                    if (maiores(end) - maiores(j)) <= diferenca
                        [a,b] = decodificar(medias, index(j), mq(e(:,index(j))), nFaixas);
                        acertos = 0;
                        erros = 0;
                        for k=1:size(elm,1)
                            % disp(['               ' num2str(elm(k,index(j))) ' >= ' num2str(a) '? && ' num2str(elm(k,index(j))) ' <= ' num2str(b) '?']);
                            if ((elm(k,index(j)) >= a) && (elm(k,index(j)) <= b))
                                % disp(['                    Sim']);
                                acertos = acertos + 1;
                            else
                                % disp(['                    Não']);
                                erros = erros + 1;
                            end
                        end
                        disp(['      - Atributo: ' clusters.('atributos'){index(j)} ' - ' num2str((acertos/size(elm,1))*100) '% (' num2str(acertos) '/' num2str(size(elm,1)) ')']);
                    end
                end
            end
            
        case 2
            disp(' ');
            disp(' ');
            disp(' ');
            disp('###########################################################');
            disp('###################     RESULTADOS      ###################');
            disp('###########################################################');
            disp(' ');
            disp(' ');
            disp(' ');

            for i=1:C
                disp('_____________________________________________________________________________');
                disp(['Cluster ' num2str(i)]);

                [maiores, index] = sort(clusters.(['c',int2str(i)]).('txs_acerto'));

                elementos = clusters.(['c',int2str(i)]).('elementos')(:,1);
                elm = clusters.(['c',int2str(i)]).('elementos')(:,2:size(clusters.(['c',int2str(i)]).('elementos'),2));

                e = [];
                for j=1:size(elementos,1);
                    for k=1:size(BDQ,1)
                        if elementos(j,1) == BDQ(k,1)
                            e = [e; BDQ(k,2:size(BDQ,2))];
                        end
                    end
                end

                for j=1:(length(maiores))
                    if (maiores(end) - maiores(j)) <= diferenca
                        a = mq(e(:,index(j)));
                        acertos = 0;
                        erros = 0;
                        for k=1:size(elm,1)
                            % disp(['               ' num2str(elm(k,index(j))) ' >= ' num2str(a) '? && ' num2str(elm(k,index(j))) ' <= ' num2str(b) '?']);
                            if elm(k,index(j)) == a
                                % disp(['                    Sim']);
                                acertos = acertos + 1;
                            else
                                % disp(['                    Não']);
                                erros = erros + 1;
                            end
                        end
                        disp(['      - Atributo: ' clusters.('atributos'){index(j)} ' - ' num2str((acertos/size(elm,1))*100) '% (' num2str(acertos) '/' num2str(size(elm,1)) ')']);
                    end
                end
            end
        
        otherwise
            disp('* Não foi possível calcular os resultados: tipo inválido!');
            R = -1;
    end
end

