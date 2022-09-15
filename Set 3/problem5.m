mu = 5;
n = 100;
theta = exp(mu);
data = randn([n 1])+mu;

total = 0;
for i=1:n
    dataS = cat(1,data(1:i-1),data(i+1:n));
    total = total+exp(mean(dataS));
end

thetaJ = total/n;
thetaH = exp(mean(data));
bias = (n-1)*(thetaJ-thetaH);
realBias = exp(mu+(1/(2*n))) - theta;
disp([bias realBias])
% (b) The jackknife bias is close to the real bias of 0.7439
% Jackknife bias was 0.8624 in the last run

r = 10^4;
totalN = 0;
totalJ = 0;

for i=1:r
    data = randn([n 1])+mu;
    total = 0;
    for j=1:n
        dataS = cat(1,data(1:j-1),data(j+1:n));
        total = total + exp(mean(dataS));
    end
    thetaB = total/n;
    thetaN = exp(mean(data));
    thetaJ = n*thetaN - (n-1)*thetaB;
    totalN = totalN + thetaN;
    totalJ = totalJ + thetaJ;
end

B1 = totalN/r - theta;
B2 = totalJ/r - theta;
disp([B1 B2])
% (c) B1 is close to what we see for the bias but B2 is consistently lower
% than B1 and the bias.
% In the last run B1 was 0.7376 and B2 was -0.0090
% 