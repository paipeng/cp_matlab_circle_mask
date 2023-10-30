% Circle Mask
% Pai Peng
% 2018


clear; close all
clc;

% parameter
M = 24;
resize_factor = 1;
dpi = 600;
folder = 'output/';
f= 'image_abc.bmp';


% read image
X = imread([folder f]);


% create circle mask matrix
inner_rad = 0*4/resize_factor;
%outer_rad = 24*4/resize_factor;
outer_rad = 288;

ec_2 = floor(0.5*(outer_rad+inner_rad)*2*pi);

center = outer_rad; 
mask1_size = center*2;

[x,y] = meshgrid(1:mask1_size,1:mask1_size);

distance = (x-center).^2+(y-center).^2;
mask = distance<outer_rad^2 & distance>inner_rad^2;

figure(1);

% do mask to input image
X(mask == 0) = 255;

imshow(X)

% save image
imwrite(X, [folder f '_circle.tif'], 'tif','resolution', dpi,'compression','none');
