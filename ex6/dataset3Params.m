function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


valores_Teste = [0.01 0.03 0.1 0.3 1 3 10 30];
erro_minimo = inf;
fprintf('--------------------------------------------------------------------------------\n');
fprintf('Buscando valores ótimos para C e sigma\n');
for C = valores_Teste
  for sigma = valores_Teste
    fprintf('Efetuando o treinamento na SVM - Support Vector Machine com o Gaussian kernel, com os seguintes valores:\n [C - %f, sigma - %f]  ', C, sigma);
    
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    
    erro   = mean(double(svmPredict(model, Xval) ~= yval));
    
    if( erro <= erro_minimo )
      C_escolhido     = C;
      sigma_escolhido = sigma;
      erro_minimo   = erro;
      fprintf('Erro mínimo atualizado para: %f', erro);
      fprintf('Novo valor C encontrado: %f, sigma = %f, com o seguinte erro mínimo = %f', C_escolhido, sigma_escolhido, erro_minimo);
    end
  end
end
C     = C_escolhido;
sigma = sigma_escolhido;

fprintf('Melhor valor \n [C = %f, sigma = %f ] \n com a seguinte predição de erro = %f\n', C, sigma, erro_minimo);
fprintf('--------------------------------------------------------------------------------\n');

% =========================================================================

end
