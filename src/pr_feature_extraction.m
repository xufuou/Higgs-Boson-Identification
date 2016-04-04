function [ dataset, varargout ] = pr_feature_extraction( dataset, type, varargin )
    nVarargs = length(varargin);

    varargout{1} = '';
    
    switch type
        case 'pca'
            % RECEIVES:
            %
            % RETURNS:
            %
            dataset.fe_pca_model = pca(dataset.X);

        case 'lda'
            % RECEIVES:
            %
            % RETURNS:
            %
            dataset.fe_lda_model = lda(dataset,2); %lda model

        case 'list-types'
                varargout{1} = {'pca', 'lda'};
                return
        case 'list-options'

            return
        otherwise % Invalid option
            fprintf('WARNING: invalid type option; doing nothing!\n');
            return
    end;
    varargout{1}=[type ' perfomed sucessfully. Use Plot to see the results.'];
end

