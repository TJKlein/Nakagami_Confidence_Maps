% Call confidence estimation for B-mode with default parameters
alpha = 2.0; beta = 90; gamma = 0.03;
% distribution based similarity measure
sim_measure = 'HEL';
index = 5;
[ map ] = confMap(imresize(EnvImg(:,:,index)+1,[500 300]), alpha, beta, gamma);
[ mapD ] = confMapDistribution(EnvImg(:,:,index)+1, alpha, beta, gamma,sim_measure);
img = imresize(log(EnvImg(:,:,index)),size(mapD));

figure;
subplot(1,3,1); imagesc(img); colormap gray; axis off;
subplot(1,3,2); imagesc(map); colormap gray; axis off;
subplot(1,3,3); imagesc(real(mapD)); colormap gray; axis off;


