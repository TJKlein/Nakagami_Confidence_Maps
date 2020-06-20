function d = KolmogDistGam(k1,theta1,k2,theta2)
 Phigh = 0.99;
 Plow = 0.01;
 
x = linspace(min([gaminv(Plow,k1,theta1)' gaminv(Plow,k2,theta2)']) ,...
    max([gaminv(Phigh,k1,theta1)' gaminv(Phigh,k2,theta2)']),1e4);
% keyboard
% x = 0:0.01:5e2;

tmp = zeros(1,length(k1));
for i=1:length(k1)

    tmp(:,i) = max(abs(gamcdf(x,k1(i),theta1(i))-gamcdf(x,k2(i),theta2(i))));
 
end
 
d = mean(tmp);
