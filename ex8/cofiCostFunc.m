function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%



diferenca = (X*Theta') - Y;
% help sum 
%   For example:
%          sum ([true, true])
%            => 2 
% You should now modify cofiCostFunc.m to return this cost in the variable
% J. Note that you should be accumulating the cost for user j and movie
% i only if R(i, j) = 1.
J = sum((diferenca.^2)(R==1))./2;

% O termo de regularizacao previne a ocorrência de overfitting
termoRegularizacaoTheta = lambda * sum(sum(Theta.^2))./2;
termoRegularizacaoX = lambda * sum(sum(X.^2))./2;

J = J + termoRegularizacaoTheta + termoRegularizacaoX;

X_grad = (diferenca.*R)*Theta; %IMPLEMENTAÇÃO VETORIZADA E NÃO REGULARIZADA
Theta_grad = ((diferenca.*R)'*X); %IDEM



% This means that you just need to add ?x(i) to the X grad(i,:) variable
% described earlier, and add ??(j) to the Theta grad(j,:) variable described
%earlier.
X_grad = X_grad + (lambda * X); %implementação regularizada
Theta_grad = Theta_grad + (lambda * Theta); %implementação regularizada



% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
