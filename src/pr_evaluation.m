function [tst_stat,out,cf_mat] = pr_evaluation(ypred,tst)

    % Get the resubstitution error.
    %trn_stat.re_error = resubLoss(model);
   % Get the cross-validation object first.
    %cv_mod = crossval(model,'kfold',partition);
   % Now get the error based on cross-validation.
    %trn_stat.cv_error = kfoldLoss(cv_mod);

    
    cf_mat=confusionmat(tst.y,ypred);
    p=sum(tst.y == 1);
    n=sum(tst.y == 2);
    tst_stat.tpr=cf_mat(1,1)/p;
    tst_stat.fpr=cf_mat(1,2)/n;
    tst_stat.accuracy=(cf_mat(1,1)+cf_mat(2,2))/(p+n);
    tst_stat.precision=cf_mat(1,1)/(cf_mat(1,1)+cf_mat(1,2));
    tst_stat.fscore=tst_stat.precision*tst_stat.tpr;
    tst_stat.error=1-tst_stat.accuracy;
    
    %stprtool_error=cerror(ypred,tst.y);
 
    out=['Classifier evaluated with a error rate of ' num2str(tst_stat.error) '.'];
end

