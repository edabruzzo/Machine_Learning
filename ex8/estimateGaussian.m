function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%


mu =  (1./m)*sum(X);

% VARIÁVEL MU_BUILT_IN PARA MERA COMPARAÇÃO
mu_built_in = mean(X);


% A funcao var() calcula a variância dos elementos de um vetor X
% Informações obtidas com o comando 'help var':
%    Compute the variance of the elements of the vector X.

%     The variance is defined as
%         var (X) = 1/(N-1) SUM_i (X(i) - mean(X))^2
%   where N is the length of the X vector.
%   If X is a matrix, compute the variance for each column and return
%     them in a row vector.
%
% COLOQUEI ABAIXO A VARIÁVEL SIGMA2_BUILT_IN PARA MERA COMPARAÇÃO
sigma2_built_in = var(X);

% AQUI ESTOU OBTENDO UM VALOR UM POUCO MENOR DO QUE A FUNÇÃO JÁ CONSTRUÍDA 
% NO OCTAVE var(X)
sigma2 = (1/m)*(sum((X - mu).^2));




% =============================================================


end
