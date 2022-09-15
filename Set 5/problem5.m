T = [0.225, 0.262, 0.217, 0.240, 0.230, 0.229, 0.235, 0.217];
S = [0.209, 0.205, 0.196, 0.210, 0.202, 0.207, 0.224, 0.223, 0.220, 0.201];

dmu = mean(T)-mean(S);
se = sqrt(var(T)/length(T)+var(S)/length(S));
W = abs(dmu/se);
p_value = 2 * (1 - normcdf(W));

disp(['p-value ', num2str(p_value)])

% The p-value is 0.0002126, which is less than 0.05 and
% is small engough or us to reject our null hypothesis and say that the 
% Twain likely did not write the Snodgrass essays.

K = 10^5;
s = abs(mean(T)-mean(S));

Z = cat(2,T,S);
p = 0;
for i=1:K
    Z_pi = Z(randperm(length(Z)));
    T_pi = Z_pi(1:length(T));
    S_pi = Z_pi(length(T)+1:end);
    s_pi = abs(mean(T_pi)-mean(S_pi));
    
    if s_pi > s
        p = p + 1;
    end
end
        
error = p/K;
disp(['Estimated p-value ', num2str(error)])

% The estimated p-value is right around 0.00065, which is less than 0.05 and
% is small engough or us to reject our null hypothesis and say that the 
% Twain likely did not write the Snodgrass essays.