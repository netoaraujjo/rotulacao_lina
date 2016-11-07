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

                % Indices dos elementos
                elementos = clusters.(['c',int2str(i)]).('elementos')(:,1);
                
                % valores dos atributos dos elementos
                elm = clusters.(['c',int2str(i)]).('elementos')(:,2:end);

                e = [];
                % Percorre cada elemento do cluster
                for j=1:size(elementos,1);
                    for k=1:size(BDQ,1)
                        if elementos(j,1) == BDQ(k,1)
                            e = [e; BDQ(k,2:size(BDQ,2))];
                        end
                    end
                end

                % Percorre os atributos
                for j=1:(length(maiores))
                    if (maiores(end) - maiores(j)) <= diferenca
                        [a,b] = decodificar(medias, index(j), mq(e(:,index(j))), nFaixas);
                        acertos = 0;
                        erros = 0;
                        
                        for k=1:size(elm,1)
                            if ((elm(k,index(j)) >= a) && (elm(k,index(j)) <= b))
                                acertos = acertos + 1;
                            else
                                erros = erros + 1;
                            end
                        end
                        disp(['      - Atributo: ' clusters.('atributos'){index(j)} ' - ' num2str((acertos/size(elm,1))*100) '% (' num2str(acertos) '/' num2str(size(elm,1)) ')']);
                    end
                end
                
                
                
                
                
                total_acertos = 0;
                total_erros = 0;
                
                % Percorre as linhas da matriz com o valor dos atributos
                for k=1:size(elm,1)
                    
                    todos_certos = 1;
                    
                    % Percorre as colunas, valores dos atributos de cada instancia
                    for j=1:(length(maiores))
                        if (maiores(end) - maiores(j)) <= diferenca
                            [a,b] = decodificar(medias, index(j), mq(e(:,index(j))), nFaixas);
                            if ((elm(k,index(j)) >= a) && (elm(k,index(j)) <= b))
                                %acertos = acertos + 1;
                            else
                                todos_certos = 0;
                                break;
                            end
                        end
                    end
                    
                    if todos_certos == 1
                        total_acertos = total_acertos + 1;
                    else
                        total_erros = total_erros + 1;
                    end
                end

                taxa_total_acertos = (total_acertos / (total_acertos + total_erros)) * 100;
                
                disp(['      - Total de acertos: ' num2str(total_acertos)]);
                disp(['      - Total de erros: ' num2str(total_erros)]);
                disp(['      - Taxa de acertos: ' num2str(taxa_total_acertos) ' - (' num2str(total_acertos) '/' num2str(total_acertos + total_erros) ')' ]);
                
                
                
                
                
                
                
                
                
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
                                % disp(['                    N�o']);
                                erros = erros + 1;
                            end
                        end
                        disp(['      - Atributo: ' clusters.('atributos'){index(j)} ' - ' num2str((acertos/size(elm,1))*100) '% (' num2str(acertos) '/' num2str(size(elm,1)) ')']);
                    end
                end
            end
        
        otherwise
            disp('* N�o foi poss�vel calcular os resultados: tipo inv�lido!');
            R = -1;
    end
end

