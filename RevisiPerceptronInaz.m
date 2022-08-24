disp('Nama : Inaz Rehan Fauzi')
disp('NIM : 40040318650001')
disp('Program Two Neuron Perceptron Learning Rule for 4 Categories')
disp(' ')
disp('Category 1 : P1 [-1 1; -1 0; -1 -3] - T1 [0 0; 0 0; 0 0]')
disp('Category 2 : P2 [0 2; 1 2] - T2 [0 1; 0 1]')
disp('Category 3 : P3 [2 0; 2 1] - T3 [1 0; 1 0]')
disp('Category 4 : P4 [1 -1; 0 -1] - T4 [1 1; 1 1]')
disp(' ')
m=input('Masukkan W11 : ');
n=input('Masukkan W12 : ');
o=input('Masukkan W13 : ');
p=input('Masukkan W14 : ');
b1=input('Masukkan b1 : ');
b2=input('Masukkan b2 : ');
% z=input('Masukkan alpha : ');

% Dengan Bias
P = [-1 1; -1 0; -1 -3; 0 2; 1 2; 2 0; 2 1; 1 -1; 0 -1]';
T = [0 0; 0 0; 0 0; 0 1; 0 1; 1 1; 1 1; 1 0; 1 0]';
eT = [1 1; 1 1]'; % Check Error
W = [m n; o p]';
b = [b1; b2];
% alpha = z; % Learning Rate
maxIter = 200;

for c = 1:maxIter
	% Train
	for i = 1:size(P,2);
        a = hardlim(W*P(:,i) + b);
        e = T(:,i) - a;
        % Update W dan b
        W = W + e*P(:,i)';
        b = b + e;
        % Update W dan b dengan learning rate
%        W = W + alpha*e*P(:,i);
%        b = b + alpha*e;
    end

    % Check
    for j = 1:size(P,2);
        a = hardlim(W*P(:,j) + b);
        eT(:,j) = T(:,j) - a
    end
    
    % find non-zero error
    k = find(eT);
    if isempty(k) % no error found...
        break;
    end
end
if c == maxIter
    disp('Max iteration reached --> FAIL')
else
    disp('Train finished...')
end
W
b
%eT
IterCount = c
