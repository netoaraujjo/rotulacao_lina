function [obtido, desejado, net] = treinar(metodo, atributo, treinamento, teste)

% Adicionar par�metro da quantidade de m�dias!
switch metodo
    case 'rna'
%         disp('# M�todo de treinamento: Rede Neural Artificial');
        % Rede Neural (Feedforward - Backpropagation)
        net = feedforwardnet();
        % net.trainFcn = 'trainbfg'; % altera a fun��o de atualiza��o

        if atributo == 2 % caso seja o primeiro atributo (1 � index!)
            tr_x = treinamento(:,3:size(treinamento, 2))';
            ts_x = teste(:,3:size(teste, 2))';
        else % sen�o...
            if atributo == size(treinamento, 2) % caso seja o �ltimo atributo
                tr_x = treinamento(:,2:(size(treinamento, 2)-1))';
                ts_x = teste(:,2:(size(teste, 2)-1))';
            else % caso seja um atributo intermedi�rio
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
        disp('* M�todo de treinamento inv�lido!');
        obtido = -1;
        desejado = -1;
        net = -1;
end
