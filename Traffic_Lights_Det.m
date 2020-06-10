I=imread('010.jpg');
warning('off','all')
R=I(:,:,1);
G=I(:,:,2);
O=I(:,:,1)*.5+I(:,:,2)*.5;
figure;

subplot(221)
[row,col]=size(R);
for j =1 :row
    for k=1:col
        if R(j,k)>=120
            R(j,k)=255;
        else
            R(j,k)=0;
        end
        if G(j,k)>=120
            G(j,k)=255;
        else
            G(j,k)=0;
        end
        if O(j,k)>=160
            O(j,k)=255;
        else
            O(j,k)=0;
        end
    end
end
SE=[1 1 1;1 1 1;1 1 1];
imdilate(R,SE);
imdilate(O,SE);
imdilate(G,SE);
imshow(R)

subplot(222)
%G=imbinarize(G);
X=R-G;
imdilate(X,SE);
imshow(X);

subplot(223)
%O=imbinarize(O);
imshow(O);
L = bwlabel(O,8);
subplot(224)

Red(X);
X=G-R;
Green(X);

Yellow(O);












