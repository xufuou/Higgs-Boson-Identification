function [ dataset,tst_dataset, varargout ] = pr_feature_selection( dataset, tst_dataset, type, varargin )
    nVarargs = length(varargin);
    varargout{1} = '';
    
    switch type
        case 'kruskal-wallis'
            % RECEIVES:
            %   {1}     - feature index
            %
            % RETURNS:
            %   {1}     - rank values
            %   {2}     - the indices
            %
            if nVarargs < 1
                fprintf('WARNING [FS-kruskal-wallis]: missing argument; doing nothing!\n');
                return
            end
            feat_index = varargin{1};
            
            dataset.fs_rank = zeros(dataset.dim,1);
            for i = 1:dataset.dim
                [p,table,stats] = kruskalwallis(dataset.X(i,:)',dataset.y','off');
                dataset.fs_rank(i)=cell2mat(table(2,5));
            end
            
            [dataset.fs_rank, dataset.fs_indices] = sort(dataset.fs_rank,'descend');

            
        case 'ROC'
            % RECEIVES:
            %   {1}     - feature index
            %
            % RETURNS:
            %   {1}     - rank values
            %   {2}     - the indices
            %
            if nVarargs < 1
                fprintf('WARNING [FS-ROC]: missing argument; doing nothing!\n');
                return
            end
            feat_index = varargin{1};
            [dataset.fs_indices, dataset.fs_rank] = rankfeatures(dataset.X, dataset.y,'Criterion','roc');
            dataset.fs_rank = sort(dataset.fs_rank,'descend');
            
        case 'mrMR'
            % RECEIVES:
            %   {1}     - feature index
            %   {2}     - 'quotient' or 'subtraction'
            %
            % RETURNS:
            %   {1}     - the indices
            %
            feat_index = varargin{1};
            
            if nVarargs >= 2 && strcmp(varargin{2}, 'quotient')
                [dataset.fs_indices, dataset.fs_rank] = mrmr_miq_d(dataset.X', dataset.y', feat_index);
            elseif nVarargs >= 2 && strcmp(varargin{2}, 'subtraction')
                [dataset.fs_indices, dataset.fs_rank] = mrmr_mid_d(dataset.X', dataset.y', feat_index);
            elseif nVarargs >= 2
                fprintf('WARNING [FS-mrMR]: invalid argument "%s"; doing nothing!\n', varargin{2});
                return
            else
                fprintf('WARNING [FS-mrMR]: missing argument ; doing nothing!\n');
                return
            end
            
        case 'list-types'
            varargout{1} = {'kruskal-wallis', 'ROC', 'mrMR'};
            return
        case 'list-opts'
            % RECEIVES:
            %   {1}     - the function
            %
            % RETURNS:
            %   {1}     - a structure with the params
            res = {};
            param = {};
            param.type = 'text';
            param.title = 'Feature Count';
            param.default = '17';
            res{1} = param;
            switch varargin{1}
                case 'kruskal-wallis'

                case 'ROC'

                case 'mrMR'
                    param = {};
                    param.type = 'list';
                    param.title = 'Mean/median';
                    param.values = {'quotient' 'subtraction'};
                    param.default = 'quotient';
                    res{2} = param;
            end;
            varargout{1} = res;
            return;
        otherwise % Invalid option
            fprintf('WARNING [FS]: invalid type option; doing nothing!\n');
            return
    end;

    %creating new data for classification

    dataset.X = dataset.X(dataset.fs_indices(1:feat_index),:);
    dataset.dim = size(dataset.X,1);
    dataset.num_data=size(dataset.X,2);
    
    tst_dataset.X = tst_dataset.X(dataset.fs_indices(1:feat_index),:);
    tst_dataset.dim = size(tst_dataset.X,1);
    tst_dataset.num_data=size(tst_dataset.X,2);
    varargout{1} = ['Features selected with ' type '.'];
    varargout{2} = dataset.fs_rank;
    varargout{3} = dataset.fs_indices;
    
    
    
end















