function [Y,X] = faker(n, beta, seed)
%FAKER 此处显示有关此函数的摘要
%   此处显示详细说明
rng(seed);
X = [randn(n,1), rand(n,1) < 0.5];
eta = [ones(n,1), X] * beta;
pi = exp(eta) ./ (1. + exp(eta));
Y = rand(n,1) < pi;
end

