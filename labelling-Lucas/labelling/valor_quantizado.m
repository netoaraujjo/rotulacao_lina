function [obtido, desejado] = valor_quantizado(dados, metodo, obtido, desejado, atributo)
% Adicionar parâmetro da quantidade de médias!
switch metodo
    case 'medias'
        for i=1:size(dados, 2)
            if i == atributo
                minimo = min(dados(:, i));
                maximo = max(dados(:, i));
                media = (minimo + maximo) / 2;
                mediaEsq = (minimo + media) / 2;
                mediaDir = (media + maximo) / 2;

                if obtido < media
                    if obtido < mediaEsq
                        obtido = 1;
                    else
                        obtido = 2;
                    end
                else
                    if obtido < mediaDir
                        obtido = 3;
                    else
                        obtido = 4;
                    end
                end
                
                if desejado < media
                    if desejado < mediaEsq
                        desejado = 1;
                    else
                        desejado = 2;
                    end
                else
                    if desejado < mediaDir
                        desejado = 3;
                    else
                        desejado = 4;
                    end
                end
            end
        end

    otherwise
        disp('* Tipo de valor quantizado inválido!');
        obtido = -1;
        desejado = -1;
end
