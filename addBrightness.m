function newIm = addBrightness(im)
    newIm=im+50;
    [rows ,cols ,rgb]=size(newIm);
    for i=1:rows
        for j=1:cols
            for k=1:rgb
                if newIm(i,j,k) > 255
                    newIm(i,j,k)=255;
                end
            end
        end
    end
end