% orthogonal matrix from a matrix using Gram-Schmidt Process
%author S M Rajkumar
clc

m = input('Enter no. of rows of matrix : ');
n = input('Enter no. of columns of matrix : ');

[A, G] = deal(round(5*randn(m,n)));

for i=1:n
    %orthogonalizing columns of A
    for j=1:i
        G(:,i) = G(:,i) - G(:,i)'*G(:,j)*G(:,j);
     end

    %normalizing columns
    G(:,i) = G(:,i)/ norm(G(:,i));
end


%comparing with QR decomposed A
[Q, R] = qr(A);

%orthogonal matrix from A using Gram-Schmidt Process
G

Q

clf
subplot(221)
hold on 
imagesc(A)
axis square, axis off
title('A')

subplot(222)
imagesc(G)
axis square, axis off
title('G')

subplot(223)
imagesc(Q)
axis square, axis off
title('Q')

subplot(224)
imagesc(G'*G)
axis square, axis off
title('G^TG')
