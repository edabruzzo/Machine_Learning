function g = sigmoidGradient(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function
%evaluated at z
%   g = SIGMOIDGRADIENT(z) computes the gradient of the sigmoid function
%   evaluated at z. This should work regardless if z is a matrix or a
%   vector. In particular, if z is a vector or matrix, you should return
%   the gradient for each element.
%  When you are done, try testing a few values by calling sigmoidGradient(z)
% at the Octave/MATLAB command line. For large values (both positive and
% negative) of z, the gradient should be close to 0. When z = 0, the gradient
% should be exactly 0.25. Your code should also work with vectors and
% matrices. For a matrix, your function should perform the sigmoid gradient
% function on every element.

g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the gradient of the sigmoid function evaluated at
%               each value of z (z can be a matrix, vector or scalar).



%O gradiente da função sigmoide é 
%derivada da função sigmoide em função 
%de z . Aqui utilizamos a função sigmoid
% a função sigmoide é a seguinte : g = 1.0 ./ (1.0 + exp(-z));
g = sigmoid(z).*(1-sigmoid(z));









% =============================================================




end
