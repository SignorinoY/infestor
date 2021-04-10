function [X, y] = faker(n, beta, seed)
%faker generate faker logistic regression sample
%   Y ~ Bern(logis(X * beta)), where X1 ~ N(0,1), X2 ~ Bern(0.5)
%{
Args:
    n: sample size
    beta: logistic regression parameters
    seed: random seed
%}
rng(seed);
X = [randn(n, 1), rand(n, 1) < 0.5];
eta = [ones(n, 1), X] * beta;
pi = exp(eta) ./ (1. + exp(eta));
y = rand(n, 1) < pi;
end