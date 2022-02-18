%  ---- BNW ----
I = imread("pic2_1.jpg")

% show input image-histogram
imshow(I);
% figure; imhist(I);

% --- contrast enhancement ---
J = enhanceContrastBw(I);

% show output image-histogram
figure; imshow(J);
% figure; imhist(J);
 
% ---- RGB ----
A = imread("pic2_4.jpg")

% show input image-histogram
figure; imshow(A);
% figure;
% imhist(A(:,:,1));
% imhist(A(:,:,2));
% imhist(A(:,:,3));

% --- contrast enhancement ---
B = enhanceContrastRgb(A);

% show output image-histogram
figure; imshow(B);
% figure;
% imhist(B(:,:,1));
% imhist(B(:,:,2));
% imhist(B(:,:,3));

% functions
function new_image = enhanceContrastBw(image)
    min_val = min(image(:)); % the minimum grayscale value
    max_val = max(image(:)); % the maximum grayscale value

    new_image = (image - min_val).*(max_val/(max_val-min_val))
end

function new_image = enhanceContrastRgb(image)
    new_image(:,:,1) = enhanceContrastBw(image(:,:,1))
    new_image(:,:,2) = enhanceContrastBw(image(:,:,2))
    new_image(:,:,3) = enhanceContrastBw(image(:,:,3))
end