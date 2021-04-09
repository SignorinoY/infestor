function beta = logisticRegression(X, y, beta0, MaxIter, epsilon)
%logisticRegression This MATLAB function fits the logistic regression model with (X, y), and returns the estimated parameters.
%    X n * p dim matrix of covariates, do not contain a column of 1s as an intercept
%    y n * 1 dim matrix of binary reponse
%    beta0 (p + 1) dim vector of initial value for beta
%    MaxIter maximum number of iterations, the default is 50
%    epsilon maximum termination tolerance error, the default is 1e-8
if nargin < 5, epsilon = 1e-8; end
if nargin < 4, MaxIter = 50; end
[n, ~] = size(X);
X = [ones(n,1), X];
beta = beta0;
m = 1;
for i=1:MaxIter
    beta0 = beta;
    eta = X * beta0;
    pi = exp(eta) ./ (1. + exp(eta));
    mu = m * pi;
    W = diag(m * pi .* (1 - pi));
    z = eta + W ^ (-1) * (y - mu);
    beta = (X' * W * X + 1e-8) ^ (-1) * X' * W * z;
    if(norm(beta - beta0) < epsilon)
        break
    end
end
end

