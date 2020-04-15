m = input('Enter Dimesnion of the square Matric A : ');

%generating random mxm matrix
A = round(5*randn(m));

%computing eigen vectors & values matrices
[V, l] = eig(A);

%coverting the Eigen value matrix to a vector
L = diag(l);

%computing iverse of V
Vinv = inv(V);

%initializing the layered matrix to be sued to reconstruct A
Ac = zeros(m);

%computing layers with V & l and adding up layers

for i = 1:size(V,1)
    A1 = V(:,i)*L(i)*Vinv(i,:) ;
    Ac = Ac + A1;
end

A

Ac

fprintf('The difference of A & Ac is: ')

A-Ac

