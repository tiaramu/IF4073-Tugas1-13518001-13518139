function newImage = histSpecification(im1, im2)
    newImage = im1;
    temp1 = equalization(im1);
    im1Eq = floor(temp1 * 255);

    temp2 = equalization(im2);
    im2Eq = floor(temp2 * 255);
    
    invHist = zeros(1, 256);
    for i = 1:256
        minIdx = 1;
        minVal = abs(im1Eq(i) - im2Eq(1));
        for j = 2:256
            if ((abs(im1Eq(i) - im2Eq(j))) < minVal)
                minVal = abs(im1Eq(i) - im2Eq(j));
                minIdx = j - 1;
            end
        end
        invHist(i) = minIdx;
    end

    [row, col, rgb] = size(im1);
    for i = 1:row
        for j = 1:col
            for k = 1:rgb
                newImage(i, j, k) = invHist(im1(i, j, k)+1);
            end
        end
    end
end

function res = equalization(im)
    [row, col, rgb] = size(im);
    histFreq = zeros(1, 256);

    for i = 1:row
        for j = 1:col
            for k = 1:rgb
                histFreq(im(i, j, k) + 1) = histFreq(im(i, j, k) + 1) + 1;
            end
        end
    end

    res = zeros(1, 256);
    sum = 0;
    for i = 1:256
        sum = sum + histFreq(i);
        res(i) = sum;
    end

    res=res/(row * col * rgb);
end