%  	Compute attenuation weighting
%   Input:
%       A:   image
%       alpha: Attenuation coefficient (see publication)
%   Output:
%       W:   Weighting expresing depth-dependent attenuation

function [ W ] = attenuationWeighting( A, alpha )

Dw = 1:size(A,1);
Dw = Dw ./ size(A,1);
Dw = repmat(Dw',1,size(A,2));
Dw = (Dw-min(Dw(:))) ./ (max(Dw(:))-min(Dw(:)));
xexp = @(x,a) exp(-a*x);
W = 1.0-xexp(Dw,alpha);


end

