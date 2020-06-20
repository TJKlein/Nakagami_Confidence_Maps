function res=GenerateNakagamiImage(dataInput, stepX, stepY, winWidth, winHeight)
clc;

threshold = getIntensityQuantile(dataInput,0.95);

%winWidth=30;
%winHeight=98; %45
%dataInput = EnvImg(:,:,98);
% dataInput = data114;
data = createPaddedData(dataInput+1,winWidth/2,winHeight/2,2);



%stepX = 2;
%stepY = 2; %15

resX = 1:stepX:size(data,2)-winWidth;
resY = 1:stepY:size(data,1)-winHeight;

shapeImg = zeros(length(resY),length(resX));
scaleImg = zeros(length(resY),length(resX));
confidenceImg = zeros(length(resY),length(resX));
%%
n = 1;

histMat = zeros(256,length(resX)*length(resY));

for y=1:length(resY)
    
    tic;
    for x=1:length(resX)
      
        sampleData=data(resY(y):resY(y)+winHeight-1,resX(x):resX(x)+winWidth-1);
        
        idx = find(data <= threshold);
        sampleData = sampleData(idx);
        sampleDataNormalized = sampleData- min(sampleData(:));
       sampleDataNormalized = (sampleDataNormalized./max(sampleDataNormalized(:)))*999+1;
        
 %       histMat(:,n) = lbp(sampleData)'; 
  %      n = n + 1;
        
         phat = gamfit(sampleData(:).^2);
         %phat = NakFit(sampleData(:).^2,0.1,150);
      res(y,x,:)=phat;
    end
    disp([num2str(y),' / ',num2str(length(resY))]);
end
        
% remove NaN values
confidenceImg(find(isnan(confidenceImg(:))))=0;