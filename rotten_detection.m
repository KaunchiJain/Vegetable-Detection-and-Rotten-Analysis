% Read the image
image = imread('Image_9g.jpg');
figure();
imshow(image)
% Convert the image to grayscale
g2 = rgb2gray(image);


%guassian filter for smoothning
Iblur1 = imgaussfilt(image,2);
figure();
imshow(Iblur1);




% Choose a threshold value
thresholdValue = 100; % This is an example value; adjust it as needed

% Convert the grayscale image to a binary image using the threshold
Ibin = imbinarize(g2, thresholdValue/255);


[labeledImage, num] = bwlabel(Ibin);
s = regionprops(labeledImage, 'BoundingBox');
imshow(Ibin), title('Image with bounding box'); % Display the binary image
hold on;

% Loop through each region and draw the bounding box
for i = 1:length(s)
    currbb = s(i).BoundingBox;
    rectangle('Position', [currbb(1), currbb(2), currbb(3), currbb(4)], 'EdgeColor', 'g');
end

hold off;


% Read the image
img = imread('Image_9.jpg');

% Convert to grayscale if necessary
grayImg = rgb2gray(img);

% Thresholding to create binary image
binaryImg = imbinarize(grayImg);

% Fill holes in the binary image
filledImg = imfill(binaryImg, 'holes');

% Find boundaries of objects in the binary image
boundaries = bwboundaries(filledImg);

% Display the original image and the detected boundaries
figure;
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(img);
hold on;
for k = 1:length(boundaries)
    boundary = boundaries{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2);
end
title('Detected Boundaries');