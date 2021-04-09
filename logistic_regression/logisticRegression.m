function [beta] = logisticRegression(Y,X,initBeta,maxIter,epsilon)
%logisticRegression 此处显示有关此函数的摘要
%   此处显示详细说明
[n, ~] = size(X);
X = [ones(n,1), X];
beta = initBeta;
m = 1;
for i=1:maxIter
    betaOld = beta;
    eta = X * betaOld;
    pi = exp(eta) ./ (1. + exp(eta));
    mu = m * pi;
    W = diag(m * pi .* (1 - pi));
    z = eta + W ^ (-1) * (Y - mu);
    beta = (X' * W * X + 1e-8) ^ (-1) * X' * W * z;
    if(norm(beta - betaOld) < epsilon)
        break
    end
end
end

