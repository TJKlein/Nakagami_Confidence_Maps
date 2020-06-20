% Hellinger distance for
% gamma distribitions of form p(x|a,b) = 1/[b^a Gamma(a)]*x^(a-1)e^(-x/b) 

function result = HellingerMatlabParam(a,b,a1,b1)

linearize =@(X) X(:);

la = linearize(a);
la1 = linearize(a1);

lb = linearize(b);
lb1 = linearize(b1);

tmp1 = la + la1;
tmp2 = gamma(la);
tmp3 = gamma(la1);
tmp4 = lb + lb1;


tmp5 = ((2.*lb.*lb1)./tmp4).^(tmp1/2).*gamma(tmp1/2);
tmp6 = ((lb.^la).*(lb1.^la1).*tmp2.*tmp3).^(1/2);

tmp7 = tmp5 ./ tmp6;

result = (bsxfun(@minus,1,tmp7));

result = sqrt(2*result);