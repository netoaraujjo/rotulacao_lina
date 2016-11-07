% Tipo:
% 1 - Atributos Númericos 
% 2 - Atributos String
function [tx_acerto] = taxa_acerto(arg1, arg2)

%     switch tipo
%         case 1
            tx_acerto = 0;
            for i=1:size(arg1,1)
                for j=1:size(arg1,2)
                    o = round(arg1(i,j));
                    d = round(arg2(i,j));

                    if o == d
                        tx_acerto = tx_acerto + 1;
                    end
                end
            end
            tx_acerto = tx_acerto / size(arg1,1) * 100;
            
%         case 3
%             tx_acerto = 0;
%             for i=1:size(arg1,1)
%                 for j=1:size(arg1,2)
%                     o = -1;
%                     d = -1;
%                     if arg1(i,j) < medias.(['a',int2str(j)]).('media')
%                         if arg1(i,j) < medias.(['a',int2str(j)]).('mediaEsq')
%                             o = 1;
%                         else
%                             o = 2;
%                         end
%                     else
%                         if arg1(i,j) < medias.(['a',int2str(j)]).('mediaDir')
%                             o = 3;
%                         else
%                             o = 4;
%                         end
%                     end
% 
%                     if arg2(i,j) < medias.(['a',int2str(j)]).('media')
%                         if arg2(i,j) < medias.(['a',int2str(j)]).('mediaEsq')
%                             d = 1;
%                         else
%                             d = 2;
%                         end
%                     else
%                         if arg2(i,j) < medias.(['a',int2str(j)]).('mediaDir')
%                             d = 3;
%                         else
%                             d = 4;
%                         end
%                     end  
% 
%                     if o == d
%                         tx_acerto = tx_acerto + 1;
%                     end
%                 end
%             end
%             tx_acerto = tx_acerto / size(arg1,1) * 100;
            
%         case 2
%             tx_acerto = 0;
%             for i=1:size(arg1,1)
%                 for j=1:size(arg1,2)
%                     o = round(arg1(i,j));
%                     d = round(arg2(i,j));
% 
%                     if o == d
%                         tx_acerto = tx_acerto + 1;
%                     end
%                 end
%             end
%             tx_acerto = tx_acerto / size(arg1,1) * 100;
            
%         otherwise
%             disp('Erro ao calcular a taxa de acerto!');
%     end
end
