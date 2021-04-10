function beta = logisticRegression(X, y, beta0, MaxIter, epsilon)
if nargin < 5, epsilon = 1e-8;end
if nargin < 4, MaxIter = 50;end
[n, ~] = size(X);
X = [ones(n, 1), X];
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
