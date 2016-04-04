function [dataset, varargout] = pr_missing_values( dataset, type, normalize, varargin )
    nVarargs = length(varargin);
    varargout{1} = '';

%TODO : refactor FEAUTURE � feature; refactor quocient � quotient

    switch type
        case 'imputation'
            % RECEIVES:
            %   {1}     - method: 'mean' or 'median'
            %
            % RETURNS:
            %

            %verificar se estamos a fazer a media para a feature nas classes correspondentes
            %adicionar imputa��o pela mediana
            dataset.X(dataset.X == -999) = NaN;
            w1=find(dataset.y==1);%separate class 1--> index of collum for data.X
            w2=find(dataset.y==2);%separate class 2-->index of collum for data.X
            
            if nVarargs >= 1 && strcmp(varargin{1}, 'mean') % use mean
                imputation1=nanmean(dataset.X(:,w1)');%mean for each feature for class 1
                imputation2=nanmean(dataset.X(:,w2)');%mean for each feature for class 2
            elseif nVarargs >= 1 && strcmp(varargin{1}, 'median') % use median
                imputation1=nanmedian(dataset.X(:,w1)');%median for each feature for class 1
                imputation2=nanmedian(dataset.X(:,w2)');%median for each feature for class 2
            else
                fprintf('WARNING [MV-imputation]: invalid or nonexistent method; doing nothing!\n');
                return
            end
                

            for i=1:size(w1,2)
                %w1(i)--> indexs of class 1
                %data.X(:,w1(i))--> features of each event
                for j=1:size(dataset.X,1)
                    if isnan(dataset.X(j,w1(i)))
                        dataset.X(j,w1(i))=imputation1(j);
                    end
                end
            end

            for i=1:size(w2,2)
                %w2(i)--> indexs of class 2
                %data.X(:,w2(i))--> features of each event
                for j=1:size(dataset.X,1)
                    if isnan(dataset.X(j,w2(i)))
                        dataset.X(j,w2(i))=imputation2(j);
                    end
                end
            end

        case 'list-types'
            varargout{1} = {'imputation'};

            return;
        case 'list-opts'
            % RECEIVES:
            %   {1}     - the function
            %
            % RETURNS:
            %   {1}     - a structure with the params
            res = {};
            switch varargin{1}
                case 'imputation'
                    param = {};
                    param.type = 'list';
                    param.title = 'Mean/median';
                    param.values = {'mean' 'median'};
                    param.default = 'mean';
                    res{1} = param;
            end;
            varargout{1} = res;
            return;
        otherwise % Invalid option
            fprintf('WARNING [MV]: invalid type option; doing nothing!\n');
            return
    end;
    
    if nargin >= 3 && strcmp(normalize, 'true')
        mu = mean(dataset.X,2);
        s = std(dataset.X,[],2);
        dataset.X = (dataset.X-repmat(mu,1,dataset.num_data))./repmat(s,1,dataset.num_data);
        varargout{1}=['Data imputated with ' type ' and normalized.'];
    end
    varargout{1}=['Data imputated with ' varargin{1} '.'];
end

