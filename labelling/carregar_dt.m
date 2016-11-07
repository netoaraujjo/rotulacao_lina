function [DS, attrs] = carregar_dt(data_set_name)
    
    DS = load([data_set_name '.txt']);
    
    fid = fopen([data_set_name '_attrs.txt']);
    ts = textscan(fid, '%s', size(DS, 2)-2, 'Delimiter', ',');
    fclose(fid);
    
    attrs = ts{1}';

end