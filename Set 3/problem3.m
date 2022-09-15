A = importdata("fiji.txt");
mags = A(:,5);
n = length(mags);
a = 1 - 0.95;
figure
ecdf(mags,'Alpha',a,'Bounds','on')

[f,x,flo,fup] = ecdf(mags,'Alpha',a);
figure
hold on
plot(x,f)
plot(x,flo)
plot(x,fup)
hold off
