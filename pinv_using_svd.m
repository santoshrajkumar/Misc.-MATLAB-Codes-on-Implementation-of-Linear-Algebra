
m = 5;

%initializing matrix A
A = randn(5);

%reducing rank
A(:,2) = A(:,1);

% SVD
[U,S,V] = svd(A);

% pseudoinvert the singular value matrix S
nonzeroels = S > eps; % find nonzero elements
S(nonzeroels) = 1./S(nonzeroels); % invert only those elements

% now pseudoinvert A
Apinv = V*S*U';

% it's sortof close to I...?
Apinv*A

% compute with MATLAB's pinv
[ Apinv pinv(A) ]
