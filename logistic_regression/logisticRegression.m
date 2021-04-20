function beta = logisticRegression(X, y, beta0, intercept, MaxIter, epsilon)
% logisticRegression fits the logistic regression model with (X, y)
% Args:
% 	X : covariates, do not contain a column of 1s as an intercept
%     y : binary reponse
%     beta0: initial parameters for logistic regression
%     intercept: whether to include the intercept term
%     MaxIter maximum number of iterations, the default is 50
%     epsilon maximum termination tolerance error, the default is 1e-8
% Returns:
%     beta: estimated parameters for logistic regression

if nargin < 6, epsilon = 1e-8;
end
if nargin < 5, MaxIter = 50;
end
if nargin < 4, intercept = true;
end
if intercept
    [n, ~] = size(X);
    X = [ones(n, 1), X];
end
beta = beta0;
m = 1;
for iter = 1:MaxIter
    beta0 = beta;
    eta = X * beta0;
    pi = exp(eta) ./ (1. + exp(eta));
    mu = m * pi;
    W = diag(m * pi .* (1 - pi));
    z = eta + W^(-1) * (y - mu);
    beta = (X' * W * X)^(-1) * X' * W * z;
    if (norm(beta - beta0) < epsilon)
        break
    end
end
end
