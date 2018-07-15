function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% itera em todos os clusters
for k = 1:K
  % numero do cluster	
  numero_cluster = 0;
  sum = zeros(n, 1);
  % tamanho do conjunto de exemplos
  for i = 1:m
	% se o centroide (ou melhor seu índice) for igual ao cluster atual
	% computa o valor da soma
    if ( idx(i) == k )
      sum = sum + X(i, :)';
      numero_cluster = numero_cluster + 1;
    end
  end
  % Retorna esta matriz de centroides, onde 
  % cada linha de centroides corresponde à 
  % média dos pontos dos dados atribuídos ao respectivo 
  %centroide
  centroids(k, :) = (sum/numero_cluster)';
end






% =============================================================


end

