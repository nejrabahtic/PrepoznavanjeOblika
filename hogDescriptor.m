function [] = hogDescriptor()
    folderslike = dir ('..\*.jpg');
    [folderslikesize, br] = size(folderslike);
    for slika=1:folderslikesize
         rgb = imread(folderslike(slika).name); 
         imshow(rgb);
%         rgb = imresize(rgb,[40 40]);
        gray = rgb2gray(rgb);
        
        h = fspecial('average', 25);
        gray_z = imfilter(slika, h);
        maska = gray - gray_z;
        k = 0.8;
        grayFinal = gray + k*maska;
        imshow(grayFinal,[]);
        
        [featureVector,hogVisualization] = extractHOGFeatures(grayFinal);
        
        figure;
        imshow(grayFinal); 
        hold on;
        plot(hogVisualization, 'Color', 'red');
        
        str = erase(folderslike(slika).name, ".jpg");
        fpath = strcat(str, '_hog.png');
        saveas(gcf,fpath);
    end