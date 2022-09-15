n = 50;
theta = 1;

data = unifrnd(0, theta, [n 1]);
thetaMLE = max(data);

B = 10^4;
para = zeros(B,1);
nonpara = zeros(B,1);

for i=1:B
    dataS1 = unifrnd(0, thetaMLE, [n 1]);
    dataS2 = datasample(data, n);
    para(i) = max(dataS1);
    nonpara(i) = max(dataS2);
end

figure
fplot(@(x) (n.*x.^(n-1)),[0.8,1])
hold on
histogram(para, 'Normalization', 'pdf')
title('Histogram of parametric theta MLE')
ylabel('Frequency')
xlabel('Theta MLE')
legend({'Analytical', 'Parametric'})
hold off
figure
fplot(@(x) (n.*x.^(n-1)),[0.8,1])
hold on
histogram(nonpara, 'Normalization', 'pdf')
title('Histogram of nonparametric theta MLE')
ylabel('Frequency')
xlabel('Theta MLE')
legend({'Analytical', 'Nonparametric'})
hold off

% Our analytical theta MLE is fairly close to both distributions with the
% parametric looking closer than the nonparametric. Some simulations are
% close than others depending on the whether a data point close to 1 is
% randomly chosen.
