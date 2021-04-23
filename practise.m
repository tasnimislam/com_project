clc;
clear all;
close all;

kala = imread('lala2.jpg');
red = kala(:,:,1);
green = kala(:,:,2);
blue = kala(:,:,3);
redbin = zeros(1,length(red(:,1))*length(red));
greenbin = zeros(1,length(green(:,1))*length(green));
bluebin = zeros(1,length(blue(:,1))*length(blue));
k=1;
for i=1:length(red(:,1))
    redbin(1,k:k+length(red)-1) = red(i,:);
    greenbin(1,k:k+length(green)-1) = green(i,:);
    bluebin(1,k:k+length(blue)-1) = blue(i,:);
    k = k+length(red);
end
redbinla = dec2bin(redbin);
greenbinla = dec2bin(greenbin);
bluebinla = dec2bin(bluebin);

%%%% Making last 2 bit 0
redbintemp = redbinla;
greenbintemp = greenbinla;
bluebintemp = bluebinla;

redbintemp(:,8) = '0';
greenbintemp(:,8) = '0';
bluebintemp(:,8) = '0';

%%%% Reconstructing Image

newred = bin2dec(redbintemp)';

newblue = bin2dec(bluebintemp)';

newgreen = bin2dec(greenbintemp)';

row = length(red(:,1));
col = length(red);
p = 1;
q = 1;
for i = 1:row
    reconred(i,1:col) = newred(1,col*(i-1)+1:col*i);
    recongreen(i,1:col) = newgreen(1,col*(i-1)+1:col*i);
    reconblue(i,1:col) = newblue(1,col*(i-1)+1:col*i);
end
newimage(:,:,1) = reconred(:,:);
newimage(:,:,2) = recongreen(:,:);
newimage(:,:,3) = reconblue(:,:);
