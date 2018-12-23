function [bw] = mask(x, y, m, n, brojListova)
    bw = poly2mask([0,0,0,0], [0,0,0,0], m, n);
    for i=1:brojListova
        bwPom = poly2mask(x(i, :), y(i, :), m, n);
        bw = bw + bwPom;
    end

    %imshow(bw)