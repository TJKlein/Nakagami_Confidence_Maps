% gampdf1(z;a,b) = z^(b-1) * b^a*exp(-b*z)/Gamma(a)

function result = ChiSquareSym(a,b,aprim,bprim)


% convert matlabs gamma scale to scale used in below fomula;
% b = 1./b;
% bprim = 1./bprim;
%%%%%%%%%%%%%%%
tmp1 = (b.^(2.*a))./(bprim.^aprim);
tmp2 = gamma(aprim)./(gamma(a).^2);
tmp3 = (gamma(2*a - aprim))./((2*b-bprim).^(2*aprim-a));

tmp4 = (bprim.^(2.*aprim))./(b.^a);
tmp5 =  gamma(a)./(gamma(aprim).^2);
tmp6 = (gamma(2.*aprim - a))./((2.*bprim-b).^(2.*a-aprim));

result = tmp1.*tmp2.*tmp3 + tmp4.*tmp5.*tmp6;
        
result = result./2;

