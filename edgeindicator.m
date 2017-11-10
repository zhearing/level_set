function g=edgeindicator(I)
sigma=1;    % scale parameter in Gaussian kernel
G=fspecial('gaussian',11,sigma); % Caussian kernel
Img_smooth=conv2(I,G,'same');  % smooth image by Gaussiin convolution
[Ix,Iy]=gradient(Img_smooth);
f=Ix.^2+Iy.^2;
g=1./(1+f);  % edge indicator function.