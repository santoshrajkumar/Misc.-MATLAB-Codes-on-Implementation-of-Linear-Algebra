
clc

%CREATE  m*n matrix 

m = 3;
n = 6;

A = randn(m,n);


%eigen decomposition of A^T A
[V, L] = eig(A'*A);

%sorting eigen vectors & values in descending order
[l, index] = sort(diag(L), 'descend');
L = diag(l);
V = V(:,index);


U = zeros(m);

%creating left singular matrix usinf eigen decomposition
for i =1:m
    U(:,i) = A*V(:,i)/sqrt(L(i,i));
end


%comparing with SVD
[Us, Ss, Vs] = svd(A);

disp([U Us])

