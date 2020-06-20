
%data = EnvImg(:,:,1);
%gammaMap = GenerateGammaImage(data,2,4,8,40);

%%
padX = 7;
padY = 12;
stepX = 2;
stepY = 5;
% distance map
gammaPadded = padarray(gammaMap(:,:,1), [padY padX], 'replicate');
gammaPadded(:,:,2) = padarray(gammaMap(:,:,2), [padY padX], 'replicate');
distMap = [];%zeros(size(gammaPadded,1)-2*padY,size(gammaPadded,2)-2*padX);
posX = 0;
posY = 0;
for y=1+padY:stepY:size(gammaPadded,1)-padY
    posY=posY+1;
    posX=0;
    for x=1+padX:stepX:size(gammaPadded,2)-padX
        posX=posX+1;       
        shape1 = gammaPadded(y-padY:y+padY,x-padX:x+padX,1);
        scale1 = gammaPadded(y-padY:y+padY,x-padX:x+padX,2);
        
        shape2 = ones((padX*2+1)*(2*padY+1),1).*gammaPadded(y,x,1);
        scale2 = ones((padX*2+1)*(2*padY+1),1).*gammaPadded(y,x,2);
        
        distMap(posY,posX)=mean(KullbackLeiblerGammaSymmetric(shape1(:),scale1(:),shape2(:),scale2(:)));
    end
end