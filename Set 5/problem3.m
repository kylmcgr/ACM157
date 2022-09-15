l0 = 1;
n = 20;
a = 0.05;
m = 10^4;

reject = 0;
for i=1:m
    data = poissrnd(l0, [n 1]);
    W = abs((mean(data)-l0)/(mean(data)/n)^(1/2));
    if W > norminv(1-a/2)
        reject = reject + 1;
    end
end

error = reject/m;
disp(['Estimated type I error rate: ', num2str(error)])

% The estimated type I error rate is right around 0.053