function [clusters, BDC] = agrupar(metodo, BD, C)

switch metodo
    case 'k-means glass'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'RI', 'Na', 'Mg', 'Al', 'Si', 'K ', 'Ca', 'Ba', 'Fe'
        };
    
    case 'k-means scientia'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'Graduaçao', 'Mestrado', 'Sub_Mestrado', 'Doutorado', 'Sub_Doutorado', 'Pós_Doutorado ', 'Sub_Pós_Doutorado'
        };
    
    case 'k-means moodle'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'Chat', 'Calendar', 'Quiz', 'Upload', 'Blog', 'Course', 'Forum', 'Library', 'Message', 'Wiki', 'Journal', 'Discussion', 'Lesson', 'Survey'
        };
    
    case 'k-means moodle_mod'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'Upload', 'Course', 'Forum', 'Library'
        };
    
    case 'k-means iris'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result]

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'Sepal Length', 'Sepal Width', 'Petal Length', 'Petal Width'
        };
    
    case 'k-means seeds'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'Area', 'Perimeter', 'Compactness', 'Length of Kernel', 'Width of Kernel', 'Asymmetry Coefficient', 'Length of Kernel Groove'
        };
        
    case 'glass-o'
        disp('* Tipo de agrupamento: Ótimo');
        result = [
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            6;
            6;
            6;
            6;
            6;
            6;
            6;
            6;
            6;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
        ];
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
        end
        clusters.('atributos') = {
            'RI', 'Na', 'Mg', 'Al', 'Si', 'K ', 'Ca', 'Ba', 'Fe'
        };
    
    case 'iris-o'
        disp('* Tipo de agrupamento: Ótimo');
        result = [
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
        ];
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
        end
        clusters.('atributos') = {
            'Sepal Length', 'Sepal Width', 'Petal Length', 'Petal Width'
        };
    
    case 'seeds-o'
        disp('* Tipo de agrupamento: Ótimo');
        result = [
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
        ];
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
        end
        clusters.('atributos') = {
            'Area', 'Perimeter', 'Compactness', 'Length of Kernel', 'Width of Kernel', 'Asymmetry Coefficient', 'Length of Kernel Groove'
        };
    
    case 'k-means glass2'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'RI', 'Na', 'Mg', 'Al', 'Si', 'K ', 'Ca', 'Ba', 'Fe', 'Classe'
        };
    
    case 'k-means iris2'
        disp('# Tipo de agrupamento: K-Means');
        % ignora-se a primeira coluna (index) na etapa de clusterização
        [result] = kmeans(BD(:,2:size(BD,2)), C);
        
        % adiciona o resultado da clusterização em cada elemento da base de dados
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
            % disp(num2str(clusters.(['c',int2str(i)]).('elementos')(:,1)));
        end
        clusters.('atributos') = {
            'Sepal Length', 'Sepal Width', 'Petal Length', 'Petal Width', 'Classe'
        };
    
    case 'glass2-o'
        disp('* Tipo de agrupamento: Ótimo');
        result = [
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            5;
            6;
            6;
            6;
            6;
            6;
            6;
            6;
            6;
            6;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
            4;
        ];
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
        end
        clusters.('atributos') = {
            'RI', 'Na', 'Mg', 'Al', 'Si', 'K ', 'Ca', 'Ba', 'Fe', 'Classe'
        };
    
    case 'iris2-o'
        disp('* Tipo de agrupamento: Ótimo');
        result = [
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            1;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            2;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
            3;
        ];
        BDC = [BD result];

        clusters = [];
        for i=1:C
            clusters.(['c',int2str(i)]).('elementos') = [];
            for j=1:size(BDC, 1)
                if BDC(j, size(BDC,2)) == i
                    clusters.(['c',int2str(i)]).('elementos') = [clusters.(['c',int2str(i)]).('elementos'); BDC(j,1:(size(BDC,2)-1))];
                end
            end
            disp(['     Cluster ' num2str(i) ': ' num2str(size(clusters.(['c',int2str(i)]).('elementos'), 1)) ' elementos']);
        end
        clusters.('atributos') = {
            'Sepal Length', 'Sepal Width', 'Petal Length', 'Petal Width', 'Classe'
        };
    
    otherwise
        disp('* Tipo de agrupamento inválido!');
        clusters = -1;
        BDC = -1;
end
