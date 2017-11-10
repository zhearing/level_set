%   Matlad code implementing Chan-Vese model in the paper 'Active Contours Without Edges'
%   This method works well for bimodal images, for example the image 'three.bmp'
%   created on 04/26/2004
%   author: Chunming Li
%   email: li_chunming@hotmail.com
%   Copyright (c) 2004-2006 by Chunming Li

clear;
close all;
clc;

Img=imread('three.bmp');     % example that CV model works well
% Img=imread('vessel.bmp');    % example that CV model does NOT work well
% Img=imread('twoCells.bmp');  % example that CV model does NOT work well
U=Img(:,:,1);

% get the size
[nrow,ncol] =size(U);

ic=nrow/2;
jc=ncol/2;
r=30;
phi_0 = sdf2circle(nrow,ncol,ic,jc,r);
figure; mesh(phi_0); title('Signed Distance Function')

%%%%%%% Img=imread('three.bmp') 的参数
delta_t=5;
lambda=1.5;
nu=1.3;
epsilon=1;
mu = 0.04;

%%%%%% Img=imread('vessel.bmp')的参数
% delta_t=3;
% lambda=1.2;
% nu=1;
% epsilon=1;
% mu = 0.04;

I=double(U);
% iteration should begin from here
phi=phi_0;
figure(2);
imagesc(uint8(I));colormap(gray)
hold on;
plotLevelSet(phi,0,'r');

numIter = 1;

for k=1:800,
    phi =EVOLUTION(I, phi, mu, nu, lambda, delta_t, epsilon, numIter);   % update level set function
%         phi =EVOLUTION(I, phi, mu, nu, lambda, delta_t, epsilon);   % update level set function

    if mod(k,25)==0
        pause(.01);
        imagesc(uint8(I));colormap(gray)
        figure(2); hold on;
        plotLevelSet(phi,0,'r');
    end    
end;
