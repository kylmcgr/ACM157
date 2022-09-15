A = [7.58 8.52 8.01 7.99 7.93 7.89 7.85 7.82 7.80];
B = [7.85 7.73 8.53 7.40 7.35 7.30 7.27 7.27 7.23];

% Permutation test

K = 10^5;
s = abs(mean(A)-mean(B));

Z = cat(2,A,B);
p = 0;
for i=1:K
    Z_pi = Z(randperm(length(Z)));
    A_pi = Z_pi(1:length(A));
    B_pi = Z_pi(length(A)+1:end);
    s_pi = abs(mean(A_pi)-mean(B_pi));
    
    if s_pi > s
        p = p + 1;
    end
end
        
error = p/K;
disp(['Estimated p-value ', num2str(error)])

% The estimated p-value is right around 0.034, which is less than 0.05 and
% is small engough or us to reject our null hypothesis and say that the 
% mean soil pH values differ for the two locations.
