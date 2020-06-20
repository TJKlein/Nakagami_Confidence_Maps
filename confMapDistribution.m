%  	Compute confidence map
%   Input:
%       data:   RF ultrasound data (one scanline per column)
%       mode:   'RF' or 'B' mode data
%       alpha, beta, gamma: See Medical Image Analysis reference    
%   Output:
%       map:    Confidence map for data
function [ map ] = confMapDistribution( data, alpha, beta, gamma, sim_measure)

disp('Preparing confidence estimation...');

% Default parameter settings
if nargin < 4
    alpha = 2.0;
    beta = 90;
    gamma = 0.05;
end

%if(nargin < 5)
%    mode = 'B';
%end

%data = double(data);
%data = (data - min(data(:))) ./ ((max(data(:))-min(data(:)))+eps);

%if(strcmp(mode,'RF'))
%    data = abs(hilbert(data));
%end

% 1, 2, 4, 40
% uncomment
% neck
%gammaMap = GenerateGammaImage(data,2,8,4,40);
%
gammaMap = GenerateGammaImage(data,2,6,10,40);
%save('gammaMap.mat','gammaMap');

%load('gammaMap.mat');

% Seeds and labels (boundary conditions)
seeds = [];
labels = [];

sc = 1:size(gammaMap(:,:,1),2); %All elements

%SOURCE ELEMENTS - 1st matrix row
sr_up = ones(1,length(sc));
seed = sub2ind(size(gammaMap(:,:,1)),sr_up,sc);
seed = unique(seed);
seeds = [seeds seed];

% Label 1
label = zeros(1,length(seed));
label = label + 1;
labels = [labels label];

%SINK ELEMENTS - last image row
sr_down = ones(1,length(sc));
sr_down = sr_down * size(gammaMap(:,:,1),1);
seed = sub2ind(size(gammaMap(:,:,1)),sr_down,sc);
seed = unique(seed);
seeds = [seeds seed];

%Label 2
label = zeros(1,length(seed));
label = label + 2;
labels = [labels label];

% Attenuation with Beer-Lambert
W = attenuationWeighting(data,alpha);

W = imresize(W, size(gammaMap(:,:,1)));

disp('Solving confidence estimation problem, please wait...');

% Apply weighting directly to image
% Same as applying it individually during the formation of the Laplacian
%data = data .* W;

% Find condidence values
map = confidenceEstimationDistribution( gammaMap, W, seeds, labels, beta, gamma, sim_measure);

% Only keep probabilities for virtual source notes.
map = map(:,:,1);

end

