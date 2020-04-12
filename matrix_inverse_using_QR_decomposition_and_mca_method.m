
n = input('Enter dimesion of the sqaure matrix : ');
A = round(5*randn(n));

[Q, R] = qr(A);

%Calculating inverse of R USING MCA METHOD
M = zeros(n);
C = zeros(n);
  
  
for i = 1:n
    for j = 1: n
        %slicing the lements of minor matrix
        rows = true(1,n);
        cols = true(1,n);
        rows(i) = false;
        cols(j) = false;
        
        %inserting the elemnts in minors matrix
        M(i,j) = det(R(rows, cols));
        
        %inserting the elements in co-factors matrix
        C(i,j) = (-1)^(i+j)*M(i,j);
    end
end

%calculating the inverse with adjugating matrix
Rinv = C'/det(R);


%calculating inverse of A
Ainvmca= Rinv*Q';

Ainv = inv(A);

clf
subplot(221)
hold on
imagesc(Ainvmca)
axis square, axis off
title('Inverse using QR factorization')

subplot(222)
imagesc(Ainvmca*A)
axis square, axis off
title('Ainvqr*A')

subplot(223)
imagesc(Ainv)
axis square, axis off
title('Inverse using MATLAB inv command')


subplot(224)
imagesc(Ainv*A)
axis square, axis off
title('Ainv*A')