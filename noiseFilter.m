function [] = noiseFilter()
    folderslike = dir('../../Slike/SlikeBiljka1/*.png');
    [folderslikesize, br] = size(folderslike);
    for slika=1:folderslikesize
        rgb = imread(folderslike(slika).name);
        J = imnoise(rgb,'speckle', 0.08);
        imshow(J);
        str = erase(folderslike(slika).name, ".png");
        fpath = strcat(str, '_noiseFilter.png');
        imwrite(J, fpath);
    end