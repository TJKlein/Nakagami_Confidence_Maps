%  	Compute confidence map
%   Input:
%       data:   RF ultrasound data (one scanline per column)
%       mode:   'RF' or 'B' mode data
%       alpha, beta, gamma: See Medical Image Analysis reference    
%   Output:
%       map:    Confidence map for data
function [ map ] = confMap( data, alpha, beta, gamma, mode)

disp('Preparing confidence estimation...');

% Default parameter settings
if nargin < 4
    alpha = 2.0;
    beta = 90;
    gamma = 0.05;
end

if(nargin < 5)
    mode = 'B';
end

data = double(data);
data = (data - min(data(:))) ./ ((max(data(:))-min(data(:)))+eps);

if(strcmp(mode,'RF'))
    data = abs(hilbert(data));
end

% Seeds and labels (boundary conditions)
seeds = [];
labels = [];

sc = 1:size(data,2); %All elements

%SOURCE ELEMENTS - 1st matrix row
sr_up = ones(1,length(sc));
seed = sub2ind(size(data),sr_up,sc);
seed = unique(seed);
seeds = [seeds seed];

% Label 1
label = zeros(1,length(seed));
label = label + 1;
labels = [labels label];

%SINK ELEMENTS - last image row
sr_down = ones(1,length(sc));
sr_down = sr_down * size(data,1);
seed = sub2ind(size(data),sr_down,sc);
seed = unique(seed);
seeds = [seeds seed];

%Label 2
label = zeros(1,length(seed));
label = label + 2;
labels = [labels label];

% Attenuation with Beer-Lambert
W = attenuationWeighting(data,alpha);

disp('Solving confidence estimation problem, please wait...');

% Apply weighting directly to image
% Same as applying it individually during the formation of the Laplacian
data = data .* W;

% Find condidence values
map = confidenceEstimation( data, seeds, labels, beta, gamma);

% Only keep probabilities for virtual source notes.
map = map(:,:,1);

end

