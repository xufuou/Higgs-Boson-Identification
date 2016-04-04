function data = imputation(data)
    imputation = nanmean(data);
    
    for i=1:size(data,2)-1
        data(isnan(data(:,i)),i) = imputation(i);
    end
    
end