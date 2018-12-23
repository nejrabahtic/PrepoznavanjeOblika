function [slika] = slika2d(slika1)
    [h, w, d] = size(slika1);
    slika = ones(h, w);
    for i = 1:h
        for j = 1:w
            slika(i, j) = slika1(i, j);
        end
    end