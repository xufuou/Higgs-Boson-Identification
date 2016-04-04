function [ dataset,varargout] = pr_load( path, name )

    ds = load(path);
    X = ds.higgs_data_for_optimization;
    names = ds.column_names;
    
    % create stprtool data structure
    dataset.X=X(:,2:end-1)';
    dataset.y=X(:,end)';
    dataset.dim=size(dataset.X,1);
    dataset.num_data=size(dataset.X,2);
    dataset.names = names(:,2:end-1);
    
    if nargin >= 2
        dataset.name = name;
    else
        dataset.name = 'no name';
    end
    varargout{1} =[path ' loaded sucessfuly with ' num2str(dataset.num_data),' events.'];
    % add mrmr and mi libs to the path
    addpath(genpath ('mrmr'));
    return;
end

