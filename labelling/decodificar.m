% Dado o atributo e a faixa, retorna o intervalo
function [ a, b ] = decodificar(faixas, atributo, faixa, nFaixas)

    count = 1;
    a = faixas.(['a',int2str(atributo)]).min;
    b = faixas.(['a',int2str(atributo)]).f1;
    
    if (count ~= faixa)
        keep = true;
        for i=2:nFaixas-1
            count = count + 1;
            if (count == faixa)
                a = faixas.(['a',int2str(atributo)]).(['f',int2str(i-1)]);
                b = faixas.(['a',int2str(atributo)]).(['f',int2str(i)]);
                keep = false;
                break;
            end
        end

        if (keep)
            count = count + 1;
            a = faixas.(['a',int2str(atributo)]).(['f',int2str(nFaixas-1)]);
            b = faixas.(['a',int2str(atributo)]).max;
        end
    end
    
end

