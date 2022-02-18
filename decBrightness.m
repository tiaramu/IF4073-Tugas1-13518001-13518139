function newIm = decBrightness(im)
    newIm=im-50;
    for i=1:rows
        for j=1:cols
            for k=1:rgb
                if newIm(i,j,k) < 0
                    newIm(i,j,k)=0;
                end
            end
        end
    end
end
