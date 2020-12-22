function [seg] = segment_image(I) 
I = rgb2gray(I);
seg = fspecial('gaussian',[5 5], 4);
seg = imfilter(I,seg,'same');
Ibcm=0;
for angle=0:15:179
   gA=gabor2(3,0.1,angle,0.75,90);
   gB=gabor2(3,0.1,angle,0.75,0);
   IbgA=conv2(seg,gA,'valid');
   IbgB=conv2(seg,gB,'valid');
   Ibc=sqrt((IbgA.^2)+(IbgB.^2));
   Ibcm=max(Ibcm,Ibc);
end
BW = edge(Ibcm,'Canny',[0.1 0.20], 2.0);
imshow(BW,'InitialMagnification',150)
end