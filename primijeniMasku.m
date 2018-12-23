function [konv] = primijeniMasku(slika, maska)
    [m, n, d] = size(slika);
    konv = zeros(m, n, d);
    for i = 1:m
        for j = 1:n
            if maska(i, j) ~= 255
                slika(i, j, :) = [0, 0 , 0];
            end
        end
    end
    konv = slika;
end