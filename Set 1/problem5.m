A = importdata("birth.txt");
A(A(:,5) == 99, :) = [];
H = A(:,5);
figure(1);
histfit(H,20)
% (a) 20 bins seems to be optimal for representing the shape of the
% distribution.
disp([mean(H) median(H) std(H) iqr(H)])
% (b) Since the mean and median are very close to each other, the center of
% the sample is well-defined.
figure(2);
boxplot(H)
figure(3);
ecdf(H)
figure(4);
qqplot(H)
% (c) I would consider the sample as being approximately normal with µ =
% 64.05 and σ^2 = 6.42
S=A;
N=A;
S(S(:,7) == 9, :) = [];
S(S(:,7) == 0, :) = [];
figure(5);
boxplot(S(:,5))
N(N(:,7) == 9, :) = [];
N(N(:,7) == 1, :) = [];
figure(6);
boxplot(N(:,5))
% (d) On average, the two groups seem to be around the same height as the
% median and quartiles are at about the same value.