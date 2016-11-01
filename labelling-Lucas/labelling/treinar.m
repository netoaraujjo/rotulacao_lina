function [obtido, desejado, net] = treinar(metodo, atributo, treinamento, teste)

% Adicionar parâmetro da quantidade de médias!
switch metodo
    case 'rna'
%         disp('# Método de treinamento: Rede Neural Artificial');
        % Rede Neural (Feedforward - Backpropagation)
        net = feedforwardnet();
        % net.trainFcn = 'trainbfg'; % altera a função de atualização

        if atributo == 2 % caso seja o primeiro atributo (1 é index!)
            tr_x = treinamento(:,3:size(treinamento, 2))';
            ts_x = teste(:,3:size(teste, 2))';
        else % senão...
            if atributo == size(treinamento, 2) % caso seja o último atributo
                tr_x = treinamento(:,2:(size(treinamento, 2)-1))';
                ts_x = teste(:,2:(size(teste, 2)-1))';
            else % caso seja um atributo intermediário
                tr_x = [treinamento(:,2:atributo-1) treinamento(:,atributo+1:size(treinamento, 2))]';
                ts_x = [teste(:,2:atributo-1) teste(:,atributo+1:size(teste, 2))]';
            end    
        end
    
        tr_y = treinamento(:,atributo)';
        desejado = teste(:,atributo);
        net = train(net,tr_x,tr_y);
        % net.IW{1}; % exibe os pesos da rede
        obtido = sim(net,ts_x)';
        
    otherwise
        disp('* Método de treinamento inválido!');
        obtido = -1;
        desejado = -1;
        net = -1;
end
