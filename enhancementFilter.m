function [] = enhancementFilter()
    folderslike = dir('../../Slike/SlikeBiljka1/*.png');
    [folderslikesize, br] = size(folderslike);
    for slika=1:folderslikesize
        rgb = imread(folderslike(slika).name);
        rgbInv = imcomplement(rgb);
        pomInv = imreducehaze(rgbInv, 'ContrastEnhancement', 'none');
        pom = imcomplement(pomInv);
        imshow(pom);
        str = erase(folderslike(slika).name, ".png");
        fpath = strcat(str, '_enhancementFilter.png');
        imwrite(pom, fpath);
    end