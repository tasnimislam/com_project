clc;
clear all;
close all;

%% reading an image and making part of the channels
image = imread('173872908_217825970141487_8383570939027393537_n.jpg');
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);

col = length(red);
row = length(red(:,1));

%% Making row vectors of the channels

redbin = zeros(1,row*col);
greenbin = zeros(1,row*col);
bluebin = zeros(1,row*col);
k=1;
for i=1:row
    redbin(1,k:k+col-1) = red(i,:);
    greenbin(1,k:k+col-1) = green(i,:);
    bluebin(1,k:k+col-1) = blue(i,:);
    k = k+col;
end

%% Making binary of the channels
redbinla = dec2bin(redbin);
greenbinla = dec2bin(greenbin);
bluebinla = dec2bin(bluebin);

%% Making last 2 bit 0
redbintemp = redbinla;
greenbintemp = greenbinla;
bluebintemp = bluebinla;

redbintemp(:,7:8) = '0';
greenbintemp(:,7:8) = '0';
bluebintemp(:,7:8) = '0';

%% Reconstructing Image

newred = bin2dec(redbintemp)';
newblue = bin2dec(bluebintemp)';
newgreen = bin2dec(greenbintemp)';

for i = 1:row
    reconred(i,1:col) = newred(1,col*(i-1)+1:col*i);
    recongreen(i,1:col) = newgreen(1,col*(i-1)+1:col*i);
    reconblue(i,1:col) = newblue(1,col*(i-1)+1:col*i);
end

newimage(:,:,1) = reconred(:,:);
newimage(:,:,2) = recongreen(:,:);
newimage(:,:,3) = reconblue(:,:);
newimage = cast(newimage,'uint8');

x = size(reconred)
    