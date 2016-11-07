function [dados, faixas] = discretizar(dados, metodo, nFaixas)

switch metodo
    case 'EWD'
        disp(['# Tipo de discretiza��o: ' num2str(nFaixas) ' - EWD']);

        if (nFaixas > 1)
            for i=2:size(dados, 2)
                minimo = min(dados(:, i));
                maximo = max(dados(:, i));
                intervalo = (maximo - minimo) / (nFaixas+1);
                
                % Calculo das faixas
                faixas.(['a',int2str(i-1)]).('min') = minimo;
                faixas.(['a',int2str(i-1)]).('max') = maximo;
                faixas.(['a',int2str(i-1)]).('f1') = minimo + intervalo;
                for j=2:nFaixas-1
                    faixas.(['a',int2str(i-1)]).(['f',int2str(j)]) = faixas.(['a',int2str(i-1)]).(['f',int2str(j-1)]) + intervalo;
                end
                
                % Discretizacao
                for j=1:size(dados, 1)
                    faixa = 1;
                    for k=1:nFaixas-1
                        if (dados(j,i) > faixas.(['a',int2str(i-1)]).(['f',int2str(k)]))
                            faixa = faixa + 1;
                        end
                    end
                    dados(j,i) = faixa;
                end
            end
        else
            disp('* Erro na discretiza��o!!');
        end

    
    % Observe que a quantidade de elementos por faixa pode nao ser igual!! O que vai ser igual e a quantidade de elementos distintos por faixa!!
    case 'EFD' 
        disp(['# Tipo de discretizacao: ' num2str(nFaixas) ' - EFD']);
        
        if (nFaixas > 1)
            nElementos = size(dados, 1);
            
            for i=2:size(dados, 2)            
                minimo = min(dados(:, i));
                maximo = max(dados(:, i));
                
                
                elm = [dados(:,1), dados(:,i)];
                [Y, I] = sort(elm(:, 2));
                elm = elm(I, :);          % Estas duas linhas ordenam a matriz "elm" conforme a coluna 2, que representa o valor do atributo
                unq = unique(elm(:,2));
                nElmDif = size(unq, 1);
                
                if nFaixas < nElmDif % Caso essa condicao nao seja satisfeita, a discretizacao nao se torna possivel!
                    nElmFx = floor(nElmDif/nFaixas);
                    
                    % Calculo das faixas
                    faixas.(['a',int2str(i-1)]).('min') = minimo;
                    faixas.(['a',int2str(i-1)]).('max') = maximo;
                    contElm = 0;
                    for j=1:nFaixas-1
                        contElm = contElm + nElmFx;
                        faixas.(['a',int2str(i-1)]).(['f',int2str(j)]) = unq(contElm);
                    end
                    
                    % Discretizacao
                    for j=1:nElementos
                        faixa = 1;
                        for k=1:nFaixas-1
                            if (dados(j,i) > faixas.(['a',int2str(i-1)]).(['f',int2str(k)]))
                                faixa = faixa + 1;
                            end
                        end
                        dados(j,i) = faixa;
                    end 
                else
                    disp(['* Nao e possivel discretizar o atributo' num2str(i)]);
                end
            end
        else
            disp('* Erro na discretizacao!!');
        end
        
    case 'ML'
        % OBS: Falta tratar o caso em que o numero de elementos na primeira
        % faixa estoura e muito o ideal, nao restando elementos para as
        % outras faixas!
        disp(['# Tipo de discretizacao: ' num2str(nFaixas) ' - MACHADO-LOPES']);

        if (nFaixas > 1)
            total = size(dados, 1);
            ideal = floor(total / nFaixas);
            
            for i=2:size(dados, 2)
%                 disp(['_____________________________________________________________' num2str(i)]);
                [sorted, index] = sort(dados(:, i));
                elements = [sorted, index];
                faixa = 1;
                
                
                counterDown = [0, 0]; % [distancia para o ideal, valor]
                counterUp = [0, 0];   % [distancia para o ideal, valor]
                counter = 1;
                distance = 0;
                currentElement = elements(1,1);
                faixas.(['a',int2str(i-1)]).('min') = currentElement;
                faixas.(['a',int2str(i-1)]).('max') = elements(size(elements,1),1);
                
                for j=2:size(elements,1)
                    if elements(j,1) ~= currentElement
                        
                        distance = ideal - counter;
                        
                        if distance == 0 % Exatamente no ideal
                            faixas.(['a',int2str(i-1)]).(['f',int2str(faixa)]) = currentElement;
                            currentElement = elements(j,1);
                            counter = 1;
                            faixa = faixa + 1;
                            if faixa == nFaixas
%                                 disp(['Faixa: ' num2str(faixa) ' quantidade de elementos: restante!    valor:' num2str(currentElement)]);
                                break;
                            end
                        else
                            if distance > 0 % Ainda nao atingiu o ideal
                                counterDown(1) = distance;
                                counterDown(2) = currentElement;
                                currentElement = elements(j,1);
                                counter = counter + 1;
                            else % Passou do ideal
                                counterUp(1) = distance;
                                counterUp(2) = currentElement;
                                
                                if abs(counterDown(1)) < abs(counterUp(1))
                                    faixas.(['a',int2str(i-1)]).(['f',int2str(faixa)]) = counterDown(2);
                                    currentElement = elements(j,1);
                                    counter = 1;
                                    faixa = faixa + 1;
                                    if faixa == nFaixas
%                                         disp(['Faixa: ' num2str(faixa) ' quantidade de elementos: restante!    valor:' num2str(currentElement)]);
                                        break;
                                    end
                                else
                                    faixas.(['a',int2str(i-1)]).(['f',int2str(faixa)]) = counterUp(2);
                                    currentElement = elements(j,1);
                                    counter = 1;
                                    faixa = faixa + 1;
                                    if faixa == nFaixas
%                                         disp(['Faixa: ' num2str(faixa) ' quantidade de elementos: restante!    valor:' num2str(currentElement)]);
                                        break;
                                    end
                                end
                            end
                        end
                    else
                        counter = counter + 1;
                    end
                end
                
%                 faixas.(['a',int2str(i-1)])
                
            
                % Discretizacao
                for j=1:size(dados, 1)
                    faixa = 1;
                    for k=1:nFaixas-1
                        if (dados(j,i) > faixas.(['a',int2str(i-1)]).(['f',int2str(k)]))
                            faixa = faixa + 1;
                        end
                    end
                    dados(j,i) = faixa;
                end
            end
        else
            disp('* Erro na discretizacao!!');
        end
        
        
    otherwise
        disp('* Tipo de quantizacao invalida!');
        dados = -1;
end
