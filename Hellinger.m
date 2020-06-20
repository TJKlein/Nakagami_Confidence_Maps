function result = Hellinger(volumeShape1, volumeScale1, volumeShape2, volumeScale2)

linearize =@(X) X(:);

lvsh1 = linearize(volumeShape1);
lvsh2 = linearize(volumeShape2);

lvsc1 = linearize(volumeScale1);
lvsc2 = linearize(volumeScale2);

elements = length(lvsh1);

tmp1 = lvsh1 + lvsh2;
tmp2 = gamma(lvsh1);
tmp3 = gamma(lvsh2);

tmp4 = lvsc1 + lvsc2;

%  result = 0;
%  for i=1:elements %
%      val1 = gamma(tmp1(i)/2)*(tmp4(i)/2)^(-(tmp1(i)/2));
%      val2 = sqrt(tmp2(i)*tmp3(i))*(1/(lvsc1(i)^lvsh1(i))*1/(lvsc2(i)^lvsh2(i)));
%      result = result +  (1- val1/val2);  
% end

tmp5 = gamma(tmp1./2).*((tmp4./2).^(-(tmp1./2)));
tmp6 = sqrt(tmp2.*tmp3).*sqrt((1./(lvsc2.^lvsh2)).*(1./(lvsc1.^lvsh1)));

tmp7 = tmp5 ./ tmp6;



result = bsxfun(@minus,1,tmp7);