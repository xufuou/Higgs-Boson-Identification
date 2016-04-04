function [ model,ypred, varargout ] = pr_classify(trn,tst,type,varargin )
    nVarargs = length(varargin);
    ypred = '';
    model = '';
    switch type
        case 'KNN'

            % RECEIVES:
            %   {1}     - training set
            %   {2}     - testing set
            %   {3}     - number of neighbours
            
            % RETURNS:
            %   {1}     - the prediction labels made by the model
            if nVarargs < 1
                fprintf('WARNING [C-KNN]: missing argument; doing nothing!\n');
                return
            end
            k=varargin{1};
            
            % stprtools implementation
            % model = knnrule(trn,k);
            % ypred = knnclass(tst.X,model); 
            
            %matlab implementation
            fprintf('Training the classifier...\n');
            model=fitcknn(trn.X',trn.y','NumNeighbors',k);
            
            fprintf('Making predictions...\n');
            ypred=predict(model,tst.X')';
    
        case 'bayesian'
            % RECEIVES:
            %   {1}     - training set
            %   {2}     - testing set
            %
            % RETURNS:
            %   {1}     - the prediction labels made by the model
            %
%             % find the classification index
%             inx1 = find(trn.y==1); 
%             inx2 = find(trn.y==2);
% 
%             % Estimation of class-conditional distributions by Expectation-Maximization Algorithm for Gaussian mixture model 
%             trn.X(:,inx1)
%             bayes_model.Pclass{1} = emgmm(trn.X(:,inx1),struct('ncomp',2)); 
%             bayes_model.Pclass{2} = emgmm(trn.X(:,inx2),struct('ncomp',2));
% 
%             % Estimation of priors
%             n1 = length(inx1); 
%             n2 = length(inx2); 
%             bayes_model.Prior = [n1 n2]/(n1+n2);
% 
% 
%             % bayer classification
%             ypred = bayescls(tst.X,bayes_model);
              fprintf('Training the classifier...\n');
              model=fitNaiveBayes(trn.X',trn.y');
              
              fprintf('Making predictions...\n');
              ypred = predict(model,tst.X');

        case 'SVM'
            % RECEIVES:
            %   {1}     - training set
            %   {2}     - testing set

            %
            % RETURNS:
            %   {1}     - the prediction labels made by the model
%             if nVarargs < 1
%                 fprintf('WARNING [C-SVM]: missing argument; doing nothing!\n');
%                 return
%             end
%             
            %stprtools implementation
%             options.ker = 'rbf';
%             options.arg = varargin{1};
%             options.C = 10; 
%             model = smo(trn,options);
%             ypred = svmclass(tst.X,model); 
            fprintf('Training the classifier...\n');
            model = fitcsvm(trn.X',trn.y','KernelFunction','rbf');
            
            fprintf('Making predictions...\n');
            ypred = predict(model,tst.X');
 
            
        case 'fisher-linear-discriminat'
            % RECEIVES:
            %   {1}     - training set
            %   {2}     - testing set
            % RETURNS:
            %   {1}     - the prediction labels made by the model
            
            % train the model
            fprintf('Training the classifier...\n');
            model = fld( trn );
            
            fprintf('Making predictions...\n');
            %linear classification
            ypred = linclass( tst.X, model ); 
            
        case 'discriminant-quadratic'
            
            fprintf('Training the classifier...\n');
            model = fitcdiscr(trn.X',trn.y','DiscrimType','quadratic');
            
            fprintf('Making predictions...\n');
            ypred = predict(model,tst.X');
        
        case 'list-types'
            varargout{1} = {'KNN', 'bayesian', 'SVM', 'fisher-linear-discriminant','discriminant-quadratic'};
            return
            case 'list-opts'
            % RECEIVES:
            %   {1}     - the function
            %
            % RETURNS:
            %   {1}     - a structure with the params
            res = {};
            switch varargin{1}
                case 'KNN'
                    param = {};
                    param.type = 'text';
                    param.title = 'No of neighbours';
                    param.default = '5';
                    res{1} = param;
            end;
            varargout{1} = res;
            return;
        otherwise % Invalid option
            fprintf('WARNING: invalid type option; doing nothing!\n');
    end;
    varargout{1}=['Classification with ' type ' completed!'];
end

