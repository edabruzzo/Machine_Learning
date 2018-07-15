function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%

% Aqui serão inicializados os clusters centroids de forma aleatória

randC = randperm(size(X, 1));

% São pegos alguns exemplos 
% aleatoriamente no próprio conjunto de dados de entrada 
% a serem classificados para inicializar os centoides
centroids = X(randC(1:K), :);


% Observação: Neste ponto, ao escolher valores do conjunto de treinamento aleatoriamente 
% para incilializar os centroides (mi_k), podemos acabar escolhendo valores de X
% do mesmo cluster. 

% Diferentes valores escolhidos na inicialização, podem conduzir a diferentes soluções
% durante a convergência do algoritmo, na tentativa de minimizar a função J de distorção

% Este algoritmo dever ser reinicializado aleatoriamente mais de uma vez
% pois ele pode cair num ótimo local durante sua execução. 

% Curiosamente: quanto maior no número de clusters, menor será o número de reinicializações.
% Ao contrário: quanto menor o número de clusters (2 a 5, p.ex.), maior será o número de reinicilizações.

% =============================================================

end

