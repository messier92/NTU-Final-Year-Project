% Demo file for cICA
% This demo shows that for the original cICA algorithm, the final results
% are sensitive to the reference signals. For robust results, see:
%
% Zhi-Lin Zhang, Morphologically Constrained ICA for Extracting Weak
% Temporally Correlated Signals, Neurocomputing 71(7-9) (2008) 1669-1679
%
% Author: Zhilin Zhang (z4zhang@ucsd.edu)
%

clear;clc;close all;

N=3000;
k=1:N;

ts = 1e-4;        % sampling period

f1 = 0.061/ts;    % true frequency, reference signals
f2 = 0.054/ts;    
f3 = 0.028/ts;

% source signals
S(1,:) = sin(2*pi*f1*ts*k +6*cos(2*pi*200*ts*k));
S(2,:) = cos(2*pi*f2*ts*k);
S(3,:) = cos(2*pi*f3*ts*k + 2);
S(4,:) = randn(1,N);
S(5,:) = randn(1,N);

T1 = 1/(f1*ts);
T2 = 1/(f2*ts);   

S = standarize(S);
ICAshow(S(:,[201:700]),'title','source signals');

A = rand(5);
X = A*S;
ICAshow(X(:,[201:700]),'title','mixed signals');
[X,V] = whiten(X);

w = rand(size(X,1),1);w=w/norm(w);

mu0 = 1;
lambda0 = 1;
gamma = 1;
learningRate = 1;
OverValue=0.000001;  maxIter = 200;

ref1 = 2*genRectangleRef(N,T1*3,1,10); threshold = 1.75;   % good ref
[y1, w1] = cICA(X, ref1, threshold, w, learningRate, mu0, lambda0, gamma, maxIter, OverValue);


ref2 = 2*genRectangleRef(N,T1*3,1,11);   % change the width of the signal
[y2, w2] = cICA(X, ref2, threshold, w, learningRate, mu0, lambda0, gamma, maxIter, OverValue);


ref3 = 2*genRectangleRef(N,T1*3,3,10);   % change the phase of the signal
[y3, w3] = cICA(X, ref3, threshold, w, learningRate, mu0, lambda0, gamma, maxIter, OverValue);

% plot the results
figure;
subplot(6,1,1);plot(ref1(201:700)); axis([-inf,inf,-4,4]);  ylabel('r1');
subplot(6,1,2);plot(y1(201:700)); axis([-inf,inf,-4,4]); ylabel('y1');

subplot(6,1,3);plot(ref2(201:700)); axis([-inf,inf,-4,4]); ylabel('r2');
subplot(6,1,4);plot(y2(201:700)); axis([-inf,inf,-4,4]);  ylabel('y2');

subplot(6,1,5);plot(ref3(201:700)); axis([-inf,inf,-4,4]); ylabel('r3');
subplot(6,1,6);plot(y3(201:700)); axis([-inf,inf,-4,4]); ylabel('y3');
