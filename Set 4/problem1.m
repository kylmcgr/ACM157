A = importdata("fiji.txt");
X = A(:,5);
Y = A(:,6);
scatter(X,Y);
title('Number of stations vs. magnitude');
xlabel('Magnitude');
ylabel('Number of stations');

theta = corr(X,Y);
disp(['Theta estimate ', num2str(theta)]);

n = length(X);
B = 10^3;
boot = zeros(B,1);
for i=1:B
    xy = datasample([X Y],n);
    boot(i) = corr(xy(:,1),xy(:,2));
end
bootSE = sqrt(var(boot));
disp(['Bootstrap estimate ', num2str(bootSE)]);

figure;
histogram(boot);
title('Histogram of bootstrap replications');
ylabel('Frequency');
xlabel('Theta Estimate');
hold on;
xline(theta, 'LineWidth', 2, 'Color', 'r');
legend('Bootstrap Estimates', 'Theta Estimate');

a = 0.025;
norm = norminv([a 1-a], theta, bootSE);
pivot = bootci(n, @corr, X, Y);
disp(['Normal interval ', num2str(norm(1)), ' ', num2str(norm(2))]);
disp(['Pivotal interval ', num2str(pivot(1)), ' ', num2str(pivot(2))]);