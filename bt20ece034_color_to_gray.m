


% Read and show original image
originalImage = imread('test.jpg'); % image file path
figure;
subplot(2, 3, 1);
imshow(originalImage);
title('Original Image');

% Show red image
redImage = originalImage(:,:,1); % Extract red layer
subplot(2, 3, 3);
imshow(redImage);
title('Red layer Image');

% Show green image
greenImage = originalImage(:,:,2); % Extract green layer
subplot(2, 3, 4);
imshow(greenImage);
title('Green layer Image');

% Show blue image
blueImage = originalImage(:,:,3); % Extract blue layer
subplot(2, 3, 5);
imshow(blueImage);
title('Blue layer Image');

% Convert to gray
grayImage = 0.2989 * originalImage(:,:,1) + 0.5870 * originalImage(:,:,2) + 0.1140 * originalImage(:,:,3);
subplot(2, 3, 2);
imshow(grayImage, []);
title('Gray Image');
