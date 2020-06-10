function [] = Yellow(X)
%YELLOW Summary of this function goes here
%   Detailed explanation goes here
subplot(223)
imshow(X)
[row,col]=size(X);
SE=[1 1 1;1 1 1;1 1 1];

X=imclose(X,SE);
%G=imopen(G,SE);
[centers,radii] = imfindcircles(X,[20 100],'ObjectPolarity','bright','Sensitivity',.96);
imshow(X)
h = viscircles(centers,radii);
c=0;
[a,b]=size(radii);
for x = 1:a
    rr=floor(centers(x,1));
    cc=floor(centers(x,2));
    radii=floor(radii);
    for i=cc-radii:cc+radii
        for j=rr-radii:rr+radii
            if i>row || i<=0 || j>col || j<=0
                continue;
            end
            if X(i,j)==255
                c=c+1;

            end
        end
    end
    c;
    d=floor(3.1416*radii(x)*radii(x));

    if abs(c-d)<d*.1
        disp('Yellow Color Detected')
    else
        %disp('Green Not Detected')
    end
end
end

