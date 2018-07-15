function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


h = X*theta;
% Na função de custo sem regularização é necessário somar
% o quadrado da diferença entre a hipótese e o valor de saída
% e não elevar ao quadrado a soma da hipótese menos a saída
funcaoCustoSemRegularizacao = sum((h-y).^2)/(2*m);
termoRegularizacao = (lambda/(2*m))*(sum(theta(2:end)).^2);
J = funcaoCustoSemRegularizacao+termoRegularizacao;
%J = (1/(2*m))*sum(power((X*theta - y),2))+ (lambda/(2*m)) * sum(power(theta(2:end),2));
grad = (1/m)*(X'*(h-y)+lambda*([0;theta(2:end, :);]));










% =========================================================================

grad = grad(:);

end
