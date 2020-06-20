function imagePadded = createPaddedData(imageData, borderWidth, borderHeight, type) % creates the data with data mirrored and copied at he border

% clone pixel along border

% Pad the data (2D only)
imagePadded=[];

% type 1: the area on the border comes from the opposite side
% e.g. left border from right side of the image, top border
% from the bottom side (stationarity)
if ( type == 1)
    
    % top left (correct) M
    imagePadded(1:borderHeight,1:borderWidth,:)=imageData(size(imageData,1):-1:size(imageData,1)-borderHeight+1,size(imageData,2):-1:size(imageData,2)-borderWidth+1,:);
    
    % top (correct) M
    imagePadded(1:borderHeight,borderWidth+1:size(imageData,2)+borderWidth,:)=imageData(size(imageData,1):-1:size(imageData,1)-borderHeight+1,:,:);
    % left (correct) M
    imagePadded(borderHeight+1:size(imageData,1)+borderHeight,1:borderWidth,:)=imageData(:,size(imageData,2):-1:size(imageData,2)-borderWidth+1,:);
    
    % bottom left (correct) M
    imagePadded(size(imageData,1)+borderHeight+1:size(imageData,1)+2*borderHeight,1:borderWidth,:)=imageData(borderHeight:-1:1,size(imageData,2):-1:size(imageData,2)-borderWidth+1,:);
    
    % bottom (correct) M
    imagePadded(size(imageData,1)+borderHeight+1:size(imageData,1)+2*borderHeight,borderWidth+1:size(imageData,2)+borderWidth,:)=imageData(borderHeight:-1:1,:,:);
    
    % bottom right (correct) M
    imagePadded(size(imageData,1)+borderHeight+1:size(imageData,1)+2*borderHeight,size(imageData,2)+borderWidth+1:size(imageData,2)+2*borderWidth,:)=imageData(borderHeight:-1:1,borderWidth:-1:1,:);
    
    % right (correct) M
    imagePadded(borderHeight+1:size(imageData,1)+borderHeight,size(imageData,2)+borderWidth+1:size(imageData,2)+2*borderWidth,:)=imageData(:,borderWidth:-1:1,:);
    % top right (correct) M
    imagePadded(1:borderHeight,borderWidth+size(imageData,2)+1:size(imageData,2)+2*borderWidth,:)=imageData(size(imageData,1):-1:size(imageData,1)-borderHeight+1,borderWidth:-1:1,:);
    % central
    imagePadded(borderHeight+1:borderHeight+size(imageData,1),borderWidth+1:borderWidth+size(imageData,2),:)=imageData(:,:,:);
    
elseif (type == 2)
    % type 2: the border is mirrored copy from the bordering
    % image data
    
    
    % top left (correct)
    imagePadded(1:borderHeight,1:borderWidth,:)=imageData(borderHeight:-1:1,borderWidth:-1:1,:);
    % top (correct)
    imagePadded(1:borderHeight,borderWidth+1:size(imageData,2)+borderWidth,:)=imageData(borderHeight:-1:1,:,:);
    % left (correct)
    imagePadded(borderHeight+1:size(imageData,1)+borderHeight,1:borderWidth,:)=imageData(:,borderWidth:-1:1,:);
    % bottom left (correct)
    imagePadded(size(imageData,1)+borderHeight+1:size(imageData,1)+2*borderHeight,1:borderWidth,:)=imageData(size(imageData,1):-1:size(imageData,1)-borderHeight+1,borderWidth:-1:1,:);
    % bottom (correct)
    imagePadded(size(imageData,1)+borderHeight+1:size(imageData,1)+2*borderHeight,borderWidth+1:size(imageData,2)+borderWidth,:)=imageData(size(imageData,1):-1:size(imageData,1)-borderHeight+1,:,:);
    % bottom right (correct)
    imagePadded(size(imageData,1)+borderHeight+1:size(imageData,1)+2*borderHeight,size(imageData,2)+borderWidth+1:size(imageData,2)+2*borderWidth)=imageData(size(imageData,1):-1:size(imageData,1)-borderHeight+1,size(imageData,2):-1:size(imageData,2)-borderWidth+1,:);
    % right (correct)
    imagePadded(borderHeight+1:size(imageData,1)+borderHeight,size(imageData,2)+borderWidth+1:size(imageData,2)+2*borderWidth,:)=imageData(:,size(imageData,2):-1:size(imageData,2)-borderWidth+1,:);
    % top right (correct)
    imagePadded(1:borderHeight,borderWidth+size(imageData,2)+1:size(imageData,2)+2*borderWidth,:)=imageData(borderHeight:-1:1,size(imageData,2):-1:size(imageData,2)-borderWidth+1,:);
    % central
    imagePadded(borderHeight+1:borderHeight+size(imageData,1),borderWidth+1:borderWidth+size(imageData,2),:)=imageData(:,:,:);
    
    
end
% set border to zero
%imagePadded = ones(size(imageData,1)+borderHeight*2,size(imageData,2)+borderWidth*2);
%imagePadded(1+borderHeight:size(imageData,1)+borderHeight,1+borderWidth:size(imageData,2)+borderWidth)=imageData;