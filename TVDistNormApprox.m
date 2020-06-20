% range = range of Norm distributions 

function d = TVDistNormApprox(mu1,sigma1,mu2,sigma2)

x = -5e2:0.01:5e2;

%d = max(abs(normpdf(x,mu1,sigma1)-normpdf(x,mu2,sigma2)));
d = 0.5*trapz(x,abs(normpdf(x,mu1,sigma1)-normpdf(x,mu2,sigma2)));
%d = 0.5*(normcdf(abs(mu2-mu1)/2,0,1)-normcdf(-abs(mu2-mu1)/2,0,1));
%d = sqrt(2/pi)*abs(mu1-mu2);