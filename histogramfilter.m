function [] = histogramfilter()
    folderslike = dir('../../Slike/SlikeBiljka1/*.png');
    [folderslikesize, br] = size(folderslike);
    for slika=1:folderslikesize
        rgb = imread(folderslike(slika).name);
        gray = rgb2gray(rgb);
        histgray = histeq(gray);
        hfig = figure;
        imhist(histgray, 64);
        str = erase(folderslike(slika).name, ".png");
        fpath = strcat(str, '_histogramFilter.png');
        saveas(hfig, fpath);
    end