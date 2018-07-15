function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the first column of W handles the "bias" terms
%

% You need to return the following variables correctly 
W = zeros(L_out, 1 + L_in);

% ====================== YOUR CODE HERE ======================
% Instructions: Initialize W randomly so that we break the symmetry while
%               training the neural network.
%
% Note: The first column of W corresponds to the parameters for the bias unit
%


%Este epsilon não tem nada a ver com o epsilon usado para checagem de gradiente
% Não entendi qual critério usar para escolher este valor inicial de epsilon
% vou iniciar com um valor bem baixo
EPSILON_INICIAL = 0.1;

% INICIALIZA O PESO THETA COM UM VALOR ALEATÓRIO PARA QUEBRAR A SIMETRIA
%DURANTE A FASE DE FEEDFORWARD
W = rand(L_out, 1 + L_in) * (2 * EPSILON_INICIAL) - EPSILON_INICIAL;



% =========================================================================

end
