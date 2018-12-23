function [] = unsharpmasking()
    folderslike = dir('../../Slike/SlikeBiljka3/*.png');
    [folderslikesize, br] = size(folderslike);
    for slika=1:folderslikesize
        rgb = imread(folderslike(slika).name);
        gray = rgb2gray(rgb);
        imshow(gray);
        h = fspecial('average', 3);
        gray_z = imfilter(slika, h);
        maska = gray - gray_z;
        k = 1.2;
        grayFinal = gray + k*maska;
        imshow(grayFinal,[]);
        str = erase(folderslike(slika).name, ".png");
        fpath = strcat(str, '_unsharpMasking.png');
        imwrite(grayFinal, fpath);
    end