function [fea, vals] = mrmr_miq_d(d, f, K)
% function [fea] = mrmr_miq_d(d, f, K)
% 
% MIQ scheme according to MRMR
%
% By Hanchuan Peng
% April 16, 2003
%

bdisp=0;

nd = size(d,2);
nc = size(d,1);

t1=cputime;
for i=1:nd, 
   t(i) = mutualinfo(d(:,i), f);
end; 

[tmp, idxs] = sort(-t);
fea_base = idxs(1:K);
vals(1) = -tmp(1);
fea(1) = idxs(1);

KMAX = min(1000,nd); %500 %20000

idxleft = idxs(2:KMAX);

k=1;


for k=2:K,
   t1=cputime;
   ncand = length(idxleft);
   curlastfea = length(fea);
   for i=1:ncand,
      t_mi(i) = mutualinfo(d(:,idxleft(i)), f); 
      mi_array(idxleft(i),curlastfea) = getmultimi(d(:,fea(curlastfea)), d(:,idxleft(i)));
      c_mi(i) = mean(mi_array(idxleft(i), :)); 
   end;

%   [tmp, fea(k)] = max(t_mi(1:ncand) ./ c_mi(1:ncand));
   [tmp, fea(k)] = max(t_mi(1:ncand) ./ (c_mi(1:ncand) + 0.01));

   vals(k) = tmp;

   tmpidx = fea(k);
   fea(k) = idxleft(tmpidx);
   idxleft(tmpidx) = [];
   

end;

return;

%===================================== 
function c = getmultimi(da, dt) 
for i=1:size(da,2), 
   c(i) = mutualinfo(da(:,i), dt);
end; 
    
