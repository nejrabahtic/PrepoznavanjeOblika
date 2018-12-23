function [] = importAnn()
    foldercsv = dir('../../CSV/CSVBiljka1/*.csv');
    folderslike = dir('../../Slike/SlikeBiljka1/*.png');
    vel = [];
    m = 0;
    n = 0;
    [folderslikesize, br] = size(folderslike);
    [foldercsvsize, br] = size(foldercsv);
    for poredu=1:folderslikesize
        folderslike(poredu).name
        s = imread(folderslike(poredu).name);
        [m, n, d] = size(s);
        vel = [vel; m, n];
    end
    for poreduu=1:foldercsvsize
        filename = foldercsv(poreduu).name;
        csv = csvread(filename);
        [brojListova,brojKolona] = size(csv);
        x = [];
        y = [];
        for i=1:brojListova
            x = [x; csv(i, 2:2:9)];
            y = [y; csv(i, 3:2:9)];
        end
        bw = [];
        [velsize, br] = size(vel);
        bw = mask (x, y, vel(poreduu,1), vel(poreduu,2), brojListova);
        str = erase(foldercsv(poreduu).name, ".csv");
        fpath = strcat(str, '_mask.png');
        imwrite(bw, fpath);
    end