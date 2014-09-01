function [subImageHighSet] = generateHighResolutionData(tr_dir, subImageSize, stride)
% Generate the 'sub-Images' with stride of 14 for training dataset.

tar_dir = 'Data/highSubImages';
tarImagePath = fullfile(tar_dir,'*.bmp');
delete(tarImagePath);
fpath = fullfile(tr_dir, '*.bmp');
img_dir = dir(fpath);

img_num = length(img_dir);

subImageHighSet = {};
subImageIndex = 0; 

for ii = 1:img_num
    
    im = imread(fullfile(tr_dir, img_dir(ii).name));
    
% Now I am not sure whether to convert here or do it with python.    
%     if size(im, 3) == 3
%         hIm = rgb2ycbcr(im);
%     else
%         hIm = im;
%     end
    [x, y, z] = size(im);
    tarSubImageNameFormat = 'Data/highSubImages/subImage%d.bmp';
    for starty = 1 : stride : y - subImageSize + 1
        for startx= 1 : stride : x - subImageSize + 1
            subImageIndex =  subImageIndex + 1;
            subImage = im(startx : startx + subImageSize - 1, starty : starty + subImageSize - 1, :);
            subImageName = sprintf(tarSubImageNameFormat, subImageIndex);
            subImageHighSet = [subImageHighSet,subImage];
            imwrite(subImage, subImageName,'bmp')
        end
    end
    
end
    
    fprintf('High-resolution sub images are done ...%d\n', size(subImageHighSet));
 
end

    
    