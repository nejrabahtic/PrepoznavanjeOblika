function [maska] = konvertuj(maska)
    [h, w, d] = size(maska);
    for i = 1:h
        for j = 1:w
            if maska(i, j) == 255 
                maska(i, j) = 1;
            end
        end
    end