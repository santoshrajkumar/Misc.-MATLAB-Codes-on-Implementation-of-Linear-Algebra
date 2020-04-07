clc
clear all

%inverse of matrix from row reduction

x = input('Enter 1 for entering the matrix manually, or 2 for generating random matrix :')

if x == 1
    A = input('Enter the square matrix (make sure that it is non-singular:')
elseif x == 2
    m = input('Enter dimesion of the random square matrix to calculate inverse: ');
    A = round(5*randn(m));
else
    fprintf('wrong entry ')
end

% input matrix random


Aaug = [A eye(m)];

AaugRREF = rref(Aaug);

Ainvrref = AaugRREF(:, m+1:end);

Ainv = inv(A);

fprintf('A*Ainvrref is: ')
A*Ainvrref

% show the augemented matrices
figure(1), clf
subplot(211), imagesc(Aaug)
title('A|I'), axis off
set(gca,'clim',[-1 1]*max(abs(Aaug(:)))*.5)

subplot(212), imagesc(AaugRREF)
title('I|A^{-1}'), axis off
set(gca,'clim',[-1 1]*max(abs(AaugRREF(:)))*.25)


% show the square matrices
figure(2), clf
subplot(131), imagesc(A)
title('Matrix A'), axis square, axis off

subplot(132), imagesc(Ainvrref)
title('Matrix A^{-1} from rref'), axis square, axis off

subplot(133), imagesc(Ainv)
title('A^{-1} from inv() function'), axis square, axis off
