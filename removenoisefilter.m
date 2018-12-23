function [] = removenoisefilter()   
    folderslike = dir('../../Slike/SlikeBiljka3/*.png');
    [folderslikesize, br] = size(folderslike);
    for slika=1:folderslikesize
        folderslike(slika).name
        s = rgb2gray(imread(folderslike(slika).name));
        J = imnoise(s,'salt & pepper',0.02);
        Kaverage = filter2(fspecial('average',3), J)/255;
        Kmedian = medfilt2(J);
        imshow(Kmedian);
        str = erase(folderslike(slika).name, ".png");
        fpath = strcat(str, '_removeNoiseFilter.png');
        imwrite(Kmedian, fpath);
    end
    