function [ imageF ] = extractImage( image, X, Y, width, height )
    
    [~, w, p] = size(image);
    imageF    = zeros(height, width, p);
    rectH     = Y:Y + height - 1;
    
    if X > w
        
        X = X - w;
    end
    
    if X + width - 1 <= w
        
        rectW = X:X + width - 1;
        
        imageF  = image(rectH, rectW, :);
    end
    
    if X + width - 1 > w
        
        lim1 = w;
        lim2 = X + width - 1 - w;
        
        rectW1 = X:lim1;
        rectW2 = 1:lim2;
        
        imageF(1:height, 1:w - X + 1, :) = image(rectH, rectW1, :);
        imageF(1:height, w - X + 2:w - X + 2 + lim2 - 1, :) = image(rectH, rectW2, :);
        
        imageF = uint8(imageF);
    end
end
