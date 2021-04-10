function [X, y] = faker(n, beta, seed)
rng(seed);
X = [randn(n, 1), rand(n, 1) < 0.5];
eta = [ones(n, 1), X] * beta;
pi = exp(eta) ./ (1. + exp(eta));
y = rand(n, 1) < pi;
end