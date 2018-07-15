function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
% tamanho do passo
stepsize = (max(pval) - min(pval)) / 1000;

for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions


% tp = true positives (VERDADEIROS POSITIVOS)
% fp = false positives (FALSOS POSITIVOS)
% fn = false negatives (FALSOS NEGATIVOS)
% SOMA COM CONDIÇÕES OU CONSTRAINTS
% soma dos valores positivos e dos valores preditos abaixo do limite epsilon

predicoes = pval < epsilon;
% soma dos valores positivos e dos preditos como positivos
tp = sum((yval==1) & (predicoes ==1));
%soma dos valores negativos e dos valores preditos como positivos
fp = sum((yval==0) & (predicoes == 1));
%soma dos valores positivos e dos valores preditos como negativos - acima do limite
fn = sum((yval==1)& (predicoes == 0));

%PRECISAO X RECALL - VER SEMANA 7
precisao = tp/(tp+fp);
recall = tp/(tp+fn);

% MÉTODO EXPLANADO NA SEMANA 7
F1 = (2*precisao*recall)/(precisao+recall);


    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
