%Fourier Transform using matrices

n = 52;
F = zeros(n);

for j=1:n
    for k=1:n
        w = exp(-2*pi*sqrt(-1)/n);
        % starts from n=0
        m = (j-1)*(k-1);
        F(j,k) = w^m;
    end
end

x = randn(n,1);
X = F*x;
X1 = fft(x);

clf
subplot(211)
plot(1:n, abs(X), 'r', 'linew', 2)
hold on
plot(1:n, abs(X1), 'o')
legend('X : coded fourier transform of x', 'X1 : MATLAB FFT of x')

subplot(212)
plot(real(F(:,6)), 'k')
legend('Real prat of F')

