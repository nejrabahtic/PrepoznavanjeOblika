function [] = convolution()
    folderslike = dir('../../Slike/SlikeBiljka3/*.png');
    foldermaske = dir('../../Maske/MaskeBiljka3/*.png');
    
    [folderslikesize, br] = size(folderslike);
    
    rgbC = [];
    
    for i = 1:folderslikesize
        rgbS = imread(folderslike(i).name);
        rgbM = imread(foldermaske(i).name);
        rgbC = primijeniMasku(rgbS, rgbM);
        imshow(rgbC);
        str = erase(folderslike(i).name, ".png");
        fpath = strcat(str, '_maskApply.png');
        imwrite(rgbC, fpath);
    end