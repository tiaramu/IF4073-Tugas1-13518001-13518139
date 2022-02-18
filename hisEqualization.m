function newImage = hisEqualization(im)
    [rows ,cols ,rgb]=size(im);
    newImage = im;
    histEq = zeros(256);
    histFreq = zeros(256);
    for i = 1:rows
        for j = 1:cols
            histFreq(im(i,j)+1)=histFreq(im(i,j)+1)+1;
        end
    end
    sum = 0.0;
    for i = 1:256
        sum = sum + histFreq(i);
        histEq(i) = floor((sum/(rows*cols))*255);
    end
    for i = 1:rows
        for j = 1:cols
        newImage(i,j) = histEq(im(i,j)+1);
        end
    end
end