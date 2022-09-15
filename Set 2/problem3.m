A = importdata("birth.txt");
A(A(:,1) == 999, :) = [];
bwt = A(:,1) * 0.0283495;
mu = mean(bwt);
n=100;
X = datasample(bwt,n,'Replace',false);
sampleMu = mean(X);
s = std(bwt);
N = length(bwt);
se = s/sqrt(n)*sqrt(1-(n-1)/(N-1));
disp([mu sampleMu se])
% (a) mu=3.3899 sampleMu=3.3750 se=3.3899
% The sample mean 

bootSe = bootB(X,N,n);
disp(bootSe)
% (b) se=0.0507

bootSeBF = bootC(X,N,n);
disp(bootSeBF)
% (c) se=0.0523

bootBs = zeros(100,1);
bootCs = zeros(100,1);
for i = 1:100
    bootBs(i) = bootB(X,N,n);
    bootCs(i) = bootC(X,N,n);
end
boxplot([bootBs,bootCs,repmat(se, 100, 1)])

function bootSe = bootB(X,N,n)
    B = 10^3;
    Pboot = repmat(X,round(N/n),1);
    sMu = zeros(B,1);
    for b = 1:B
        sb = datasample(Pboot,n,'Replace',false);
        sMu(b) = mean(sb);
    end
    aveMu = mean(sMu);
    bootSe =  sqrt((1/B)*sum((sMu-aveMu).^2));
end

function bootSeBF = bootC(X,N,n)
    B = 10^3;
    k = floor(N/n);
    r = N-n*k;
    Pboot1 = repmat(X,k,1);
    Pboot2 = repmat(X,k+1,1);
    p = (1-r/n)*(1-r/(N-1));
    sMuBF = zeros(B,1);
    for b = 1:B
        if rand() < p
            sbBF = datasample(Pboot1,n,'Replace',false);
        else
            sbBF = datasample(Pboot2,n,'Replace',false);
        end
        sMuBF(b) = mean(sbBF);
    end
    aveMuBF = mean(sMuBF);
    bootSeBF =  sqrt((1/B)*sum((sMuBF-aveMuBF).^2));
end