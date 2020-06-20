function d = TotalVariationGamma(k1,theta1,k2,theta2)

Phigh = 0.99;
Plow = 0.01;

x = linspace(min([gaminv(Plow,k1,theta1)' gaminv(Plow,k2,theta2)']) ,...
    max([gaminv(Phigh,k1,theta1)' gaminv(Phigh,k2,theta2)']),1e4);

tmp = zeros(1,length(k1));

for i=1:length(k1)
%tmp(:,i) = max(abs(gampdf(x,k1(i),theta1(i))-gampdf(x,k2(i),theta2(i))));

tmp(:,i) = 0.5*trapz(x,abs(gampdf(x,k1(i),theta1(i))-gampdf(x,k2(i),theta2(i))));

%% NOTE: trapzf is not faster, in fact it is slower than trapz!
% tic
% tmp(:,i) = 0.5*trapzf(x,abs(gampdf(x,k1(i),theta1(i))-gampdf(x,k2(i),theta2(i))));
% toc
end

d = mean(tmp);