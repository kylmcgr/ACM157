n = 10;
a = 1;
b = 3;
mu = (a+b)/2;

sum = 0;
B = 10^4;
for i=1:B
    data = unifrnd(a, b, [n 1]);
    muS = (min(data)+max(data))/2;
    sum = sum+(muS-mu)^2;
end
    
MSE = sum/B;
disp(['MSE of mu MLE = ', num2str(MSE)]);

% The simulation MSE of mu MLE is 0.015273, less than that of the
% analytical value of 1/30=0.0333