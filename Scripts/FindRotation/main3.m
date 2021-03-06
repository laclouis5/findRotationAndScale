clear
close all
clc

%%
path  = 'Images/360degreesImages/canyon.jpg';
image = imread(path);

coef      = 8;
[h, w, p] = size(image);
h1        = floor(h/coef);
w1        = floor(w/coef);

%%
angleW = 0:360/w:360 - 360/w;
angleH = 0:180/h:180 - 180/h;

coordSph = zeros(h1, w1, p);

%%
for i = 1:h1
    for j = 1:w1 
        coordSph(i, j, :) = [angleW(coef*j), angleH(coef*i), 1];
        imageAff(i, j, :) = image(coef*i, coef*j, :); 
    end
end

%%
[x, y, z] = sph2cart(coordSph(:, :, 1), coordSph(:, :, 2), coordSph(:, :, 3));