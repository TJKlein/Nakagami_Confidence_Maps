%  	Compute 6-Connected Laplacian for confidence estimation problem
%   
%   Input:
%       data:   RF ultrasound data (one scanline per column)
%       alpha, beta, gamma: See Medical Image Analysis reference
%   Output:
%       map:    Confidence map for data

function L = confidenceLaplacianDistribution( P, gammaMap, attenuationMap, beta, gamma, sim_measure )


shape = gammaMap(:,:,1);
scale = gammaMap(:,:,2);

factor = 0.2;
scalefactor = 10.0;
[m,n] = size(P);
p = find(P);

i = P(p); % Index vector
j = P(p); % Index vector
s = zeros(size(p)); % Entries vector, initially for diagonal
a = zeros(size(p));

%KullbackLeiblerGammaSymmetric

if ( true)
% Vertical edges
for k = [-1 1]   
   Q = P(p+k);   
   q = find(Q);    
   ii = P(p(q));
   i = [i; ii];
   jj = Q(q);
   j = [j; jj];
   
       
   %W = abs(A(p(ii))-A(p(jj))); % Intensity derived weight
   if strcmp(sim_measure, 'GEO')
   W = GammaGeodesicDistance(shape(p(ii)),scale(p(ii)),shape(p(jj)),scale(p(jj)));
   elseif strcmp(sim_measure, 'KL')
   W = KullbackLeiblerGammaSymmetric(shape(p(ii)),scale(p(ii)),shape(p(jj)),scale(p(jj)));
   elseif strcmp(sim_measure, 'HEL')
   W = HellingerMatlabParam(shape(p(ii)),scale(p(ii)),shape(p(jj)),scale(p(jj)));
   elseif strcmp(sim_measure, 'CHI')
   W = ChiSquareSym(shape(p(ii)),scale(p(ii)).*shape(p(ii)),shape(p(jj)),scale(p(jj)).*shape(p(jj)));
  elseif strcmp(sim_measure, 'TV')
       
       sh1=shape(p(ii));
       sc1=scale(p(ii)).*shape(p(ii));
       sh2=shape(p(jj));
       sc2=scale(p(jj)).*shape(p(jj));
       W=zeros(size(sh1));
       parfor u=1:numel(sh1)
           W(u)=TotalVariationGamma(sh1(u),sc1(u),sh2(u),sc2(u));
       end
   elseif strcmp(sim_measure, 'KOL')
       sh1=shape(p(ii));
       sc1=scale(p(ii)).*shape(p(ii));
       sh2=shape(p(jj));
       sc2=scale(p(jj)).*shape(p(jj));
       W=zeros(size(sh1));
       parfor u=1:numel(sh1)
           W(u)=KolmogDistGam(sh1(u),sc1(u),sh2(u),sc2(u));
       end
       
   end    
 
  A = mean([attenuationMap(p(ii)) attenuationMap(p(jj))]')';
   a = [a; A];
   s = [s; real(W)];
   
end


vl = numel(s);

% Diagonal edges
for k = [(m-1) (m+1) (-m-1) (-m+1)]   
   Q = P(p+k);
   q = find(Q);    
   ii = P(p(q));
   i = [i; ii]; 
   jj = Q(q);
   j = [j; jj];
   %W = abs(A(p(ii))-A(p(jj))); % Intensity derived weight
if strcmp(sim_measure, 'GEO')
    W = GammaGeodesicDistance(shape(p(ii)),scale(p(ii)),shape(p(jj)),scale(p(jj)));
elseif strcmp(sim_measure, 'KL')
   W = KullbackLeiblerGammaSymmetric(shape(p(ii)),scale(p(ii)),shape(p(jj)),scale(p(jj)));
elseif strcmp(sim_measure, 'HEL')
    W = Hellinger(shape(p(ii)),scale(p(ii)).*shape(p(ii)),shape(p(jj)),scale(p(jj)).*shape(p(jj)));
elseif strcmp(sim_measure, 'CHI')
   W = ChiSquareSym(shape(p(ii)),scale(p(ii)).*shape(p(ii)),shape(p(jj)),scale(p(jj)).*shape(p(jj)));   
elseif strcmp(sim_measure, 'TV')
       sh1=shape(p(ii));
       sc1=scale(p(ii)).*shape(p(ii));
       sh2=shape(p(jj));
       sc2=scale(p(jj)).*shape(p(jj));
       W=zeros(size(sh1));
       parfor u=1:numel(sh1)
           W(u)=TotalVariationGamma(sh1(u),sc1(u),sh2(u),sc2(u));
       end
   elseif strcmp(sim_measure, 'KOL')
       sh1=shape(p(ii));
       sc1=scale(p(ii)).*shape(p(ii));
       sh2=shape(p(jj));
       sc2=scale(p(jj)).*shape(p(jj));
       W=zeros(size(sh1));
       parfor u=1:numel(sh1)
           W(u)=KolmogDistGam(sh1(u),sc1(u),sh2(u),sc2(u));
       end
       
   end 
  A = mean([attenuationMap(p(ii)) attenuationMap(p(jj))]')';
   a = [a; A];
   s = [s; real(W)];
end


% Horizontal edges
for k = [m -m]
  
   Q = P(p+k);  
   q = find(Q);   
   ii = P(p(q));
   i = [i; ii];
   jj = Q(q);
   j = [j; jj];
   %W = abs(A(p(ii))-A(p(jj))); % Intensity derived weight
   if strcmp(sim_measure, 'GEO')
   W = GammaGeodesicDistance(shape(p(ii)),scale(p(ii)),shape(p(jj)),scale(p(jj)));
   elseif strcmp(sim_measure, 'KL')
    W = KullbackLeiblerGammaSymmetric(shape(p(ii)),scale(p(ii)),shape(p(jj)),scale(p(jj)));
   elseif strcmp(sim_measure, 'HEL')
   W = Hellinger(shape(p(ii)),scale(p(ii)).*shape(p(ii)),shape(p(jj)),scale(p(jj)).*shape(p(jj)));
   elseif strcmp(sim_measure, 'CHI')
   W = ChiSquareSym(shape(p(ii)),scale(p(ii)).*shape(p(ii)),shape(p(jj)),scale(p(jj)).*shape(p(jj)));
   elseif strcmp(sim_measure, 'TV')
       sh1=shape(p(ii));
       sc1=scale(p(ii)).*shape(p(ii));
       sh2=shape(p(jj));
       sc2=scale(p(jj)).*shape(p(jj));
       W=zeros(size(sh1));
       parfor u=1:numel(sh1)
           W(u)=TotalVariationGamma(sh1(u),sc1(u),sh2(u),sc2(u));
       end
   elseif strcmp(sim_measure, 'KOL')
       
       sh1=shape(p(ii));
       sc1=scale(p(ii)).*shape(p(ii));
       sh2=shape(p(jj));
       sc2=scale(p(jj)).*shape(p(jj));
       W=zeros(size(sh1));
       parfor u=1:numel(sh1)
           W(u)=KolmogDistGam(sh1(u),sc1(u),sh2(u),sc2(u));
       end
       
   end 
   A = mean([attenuationMap(p(ii)) attenuationMap(p(jj))]')';
   a = [a; A];
   s = [s; real(W)];
end

%save('smapTV.mat','s','i','j');
else
 %   load('smap_TV.mat');
    vl = numel(s);
end

if strcmp(sim_measure, 'GEO')
    % Geodesic
s = s.^0.75;
elseif strcmp(sim_measure, 'KL')
% KL
s = s.^0.6;
elseif strcmp(sim_measure, 'HEL')
    elseif strcmp(sim_measure, 'TV')
    s = s.^10.5;
elseif strcmp(sim_measure, 'KOL')
    s = s.^1.0;
end
% Normalize weights
s = (s - min(s(:))) ./ (max(s(:)) - min(s(:)) + eps);

a = (a - min(a(:))) ./ (max(a(:)) - min(a(:)) + eps);


% Horizontal penalty
s(vl+1:end) = s(vl+1:end) + gamma;

% Normalize differences
s = (s - min(s(:))) ./ (max(s(:)) - min(s(:)) + eps);

% Gaussian weighting function
EPSILON = 10e-6;
s = -((exp(-beta*s)) + EPSILON);

% Create Laplacian, diagonal missing
L = sparse(i,j,s); % i,j indices, s entry (non-zero) vector

% Reset diagonal weights to zero for summing 
% up the weighted edge degree in the next step
L = spdiags(zeros(size(s,1),1),0,L);
% Weighted edge degree
D = full(abs(sum(L,1)))';

% Finalize Laplacian by completing the diagonal
L = spdiags(D,0,L);


end

