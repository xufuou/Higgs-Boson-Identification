function [ dataset, varargout ] = pr_plot( dataset, type, varargin )
    nVarargs = length(varargin);

    switch type
        case 'results-pca-linproj'
            % RECEIVES:
            %
            % RETURNS:
            %
            figure;
            proj = linproj(dataset,dataset.fe_pca_model); % linear projetion using pca model
            ppatterns(proj);
            title('PCA: Linear Projection');
            
        case 'results-pca-eigenvalues'
            % RECEIVES:
            %
            % RETURNS:
            %
            figure;
            x = linspace(1,dataset.dim,dataset.dim);
            plot(x, dataset.fe_pca_model.eigval, 'b.', x, dataset.fe_pca_model.eigval, 'b');
            title('PCA: Eigenvalues');
            
        case 'results-pca-table'
            % RECEIVES:
            %
            % RETURNS:
            %
            f = figure;

            fe_pca_eigval = dataset.fe_pca_model.eigval; %eigval
            fe_pca_variation = (dataset.fe_pca_model.eigval/sum(dataset.fe_pca_model.eigval)*100);%percentage of variation
            fe_pca_c_eigval = cumsum(fe_pca_eigval);%cumulative eigval
            fe_pca_c_variation = cumsum(fe_pca_variation);%cumulative percentage of variation

            d = [fe_pca_c_eigval, fe_pca_c_variation, fe_pca_c_eigval, fe_pca_c_variation];

            cnames = {'Eigenvalues', 'Variation', 'C_Eigenvalue', 'C_Variation'};
            t = uitable(f,'Data',d, 'ColumnName',cnames);

            set(t, 'Units', 'normalized');
            set(t, 'Position', [0, 0, 1, 1]);

            case 'results-lda'
            % RECEIVES:
            %
            % RETURNS:
            %
        case 'list-types'
            varargout{1} = {'results-pca-linproj', 'results-pca-eigenvalues', 'results-pca-table'};
        otherwise % Invalid option
            fprintf('WARNING: invalid type option; doing nothing!\n');
    end;
end

