
%% Load example B-Mode NECK image 
%load('\data\neck_BMode.mat');

% Call confidence estimation for B-mode with default parameters
alpha = 2.0; beta = 90; gamma = 0.03;
% choose similarity measure
sim_measure = 'HEL';
%[ map ] = confMap(imresize(EnvImg(:,:,1)+1,[500 300]), alpha, beta, gamma);
ConfImg=[];
for i=1:size(EnvImg,3)
% confidence map of B-Mode
%[ map ] =    confMap(imresize(EnvImg(:,:,i)+1,[300 300]), alpha, beta, gamma);
% compute the confidence map distriubution based (RF mode)
[ map ] = confMapDistribution(EnvImg(:,:,i)+1, alpha, beta, gamma,sim_measure);
ConfImg(:,:,i)=imresize(map,size(EnvImg(:,:,1)));
debug = 5;
end
