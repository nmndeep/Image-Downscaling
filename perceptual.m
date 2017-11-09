%%%%%%%%%%%%%        CODE FOR OZITERLII ET AL.     [2015] %%

clc
clear all
close all

s=3;
Img1=imread('barbara.bmp');
 figure,imshow(Img1),title('Original')
[Height, Width, Depth]=size(Img1);
np=4;


% % % % % % % % % % % % % % % % % % % % %   RED BAND SINGLE CHANNEL %%%%

I =(Img1(:,:,1));
avg4 = fspecial('average',[4 4]);
red = imfilter(I,avg4,'conv');

% display(Result)
L=red(1:s:Height,1:s:Width);
% figure,imshow(L),title('subsample');

%%%%%%%%%%%%%%%%%%    L2   %%%%%%%%%%%%%%
K1=I.^2;

red1 = imfilter(K1,avg4,'conv');
L2=red1(1:s:Height,1:s:Width);
%    figure,imshow(L),title('L2');

%%%%%%%%%%%%%%%%%%%%%%%%   M   %%%%%%%%%%%%%%%%%%
avnp =fspecial('average',[round(sqrt(np)) round(sqrt(np))]);
M=imfilter(L,avnp,'conv');
%   figure,imshow(M),title('M');

% % % % % % % % % % % % % % % % % %   SL   
M2=L.^2;
S4=imfilter(M2,avnp,'conv');

MM=M.^2;
Sl=S4-(MM);
% figure,imshow(S4),title('Sl');

% % % % % % % % % % SH %%%%%%%%%%%%%%%%%%%%%%%%%%

S7=imfilter(L2,avnp,'conv');

Sh=S7-(MM);
%  figure,imshow(Sh),title('Sh');
R=(sqrt(double(Sh./Sl)));
e= 0.000001;
for idx = 1:numel(R)
    element = R(idx);
    if isnan(element)
        R(idx)=0;
    elseif isreal(element)
        R(idx)=element;
    elseif element < e
        R(idx)=0;
    else
        R(idx)=0;
    end
end
sz=size(M);
I=ones(sz);
I=padarray(I,1);
N=imfilter(I,avnp,'conv');

P=R.*double(M);
P=padarray(P,1);

T=imfilter(P,avnp,'conv');
% figure,imshow(T),title('T');
M=padarray(M,1);

M=imfilter(M,avnp,'conv');
%  figure,imshow(M),title('M');
R=padarray(R,1);

R=imfilter(R,avnp,'conv');
%  figure,imshow(R),title('R');
size(R);
L=padarray(L,1);
K=R.*double(L);
%  figure,imshow(K),title('K');

J=double(M)+double(K)-double(T);
J=uint8(J);
%  figure,imshow(J),title('J');

D1=double(J)./N;
D1=uint8(D1);
%  figure,imshow(D1),title('D1');


% % % % % % % % % % % % % % % % %  GREEN BAND SINGLE CHANNEL %%%%%%%%% 
  
I =(Img1(:,:,2));
avg4 = fspecial('average',[4 4]);
red = imfilter(I,avg4,'conv');

% display(Result)
L=red(1:s:Height,1:s:Width);
% figure,imshow(L),title('subsample');

%%%%%%%%%%%%%%%%%%    L2   %%%%%%%%%%%%%%
K1=I.^2;

red1 = imfilter(K1,avg4,'conv');
L2=red1(1:s:Height,1:s:Width);
%    figure,imshow(L),title('L2');

%%%%%%%%%%%%%%%%%%%%%%%%   M   %%%%%%%%%%%%%%%%%%
avnp =fspecial('average',[2 2]);
M=imfilter(L,avnp,'conv');
%   figure,imshow(M),title('M');

% % % % % % % % % % % % % % % % % %   SL   
M2=L.^2;
S4=imfilter(M2,avnp,'conv');

MM=M.^2;
Sl=S4-(MM);
% figure,imshow(S4),title('Sl');

% % % % % % % % % % SH %%%%%%%%%%%%%%%%%%%%%%%%%%

S7=imfilter(L2,avnp,'conv');

Sh=S7-(MM);
%  figure,imshow(Sh),title('Sh');
R=(sqrt(double(Sh./Sl)));
e=0.000001;
for idx = 1:numel(R)
    element = R(idx);
    if isnan(element)
        R(idx)=0;
    elseif isreal(element)
        R(idx)=element;
    elseif element < e
        R(idx)=0;
    else
        R(idx)=0;
    end
end
sz=size(M);
I=ones(sz);
I=padarray(I,1);
N=imfilter(I,avnp,'conv');

P=R.*double(M);
P=padarray(P,1);
T=imfilter(P,avnp,'conv');
% figure,imshow(T),title('T');
M=padarray(M,1);
M=imfilter(M,avnp,'conv');
%  figure,imshow(M),title('M');

R=padarray(R,1);
R=imfilter(R,avnp,'conv');
%  figure,imshow(R),title('R');
L=padarray(L,1);
K=R.*double(L);
%  figure,imshow(K),title('K');

J=double(M)+double(K)-double(T);
J=uint8(J);
%  figure,imshow(J),title('J');

D2=double(J)./N;
D2=uint8(D2);
% figure,imshow(D2),title('D2');


% % % % % % % % % % %     BLUE BAND SINGLE CHANNEL %%%%%%%%%%

I =(Img1(:,:,3));
avg4 = fspecial('average',[4 4]);
red = imfilter(I,avg4,'conv');

% display(Result)
L=red(1:s:Height,1:s:Width);
% figure,imshow(L),title('subsample');

%%%%%%%%%%%%%%%%%%    L2   %%%%%%%%%%%%%%
K1=I.^2;

red1 = imfilter(K1,avg4,'conv');
L2=red1(1:s:Height,1:s:Width);
%    figure,imshow(L),title('L2');

%%%%%%%%%%%%%%%%%%%%%%%%   M   %%%%%%%%%%%%%%%%%%
avnp =fspecial('average',[2 2]);
M=imfilter(L,avnp,'conv');
%   figure,imshow(M),title('M');

% % % % % % % % % % % % % % % % % %   SL   
M2=L.^2;
S4=imfilter(M2,avnp,'conv');

MM=M.^2;
Sl=S4-(MM);
% figure,imshow(S4),title('Sl');

% % % % % % % % % % SH %%%%%%%%%%%%%%%%%%%%%%%%%%

S7=imfilter(L2,avnp,'conv');

Sh=S7-(MM);
%  figure,imshow(Sh),title('Sh');
R=(sqrt(double(Sh./Sl)));
e=0.000001;
for idx = 1:numel(R)
    element = R(idx);
    if isnan(element)
        R(idx)=0;
    elseif isreal(element)
        R(idx)=element;
    elseif element < e
        R(idx)=0;
    else
        R(idx)=0;
    end
end
sk=size(R);
sz=size(M);
I=ones(sz);
I=padarray(I,1);
N=imfilter(I,avnp,'conv');

P=R.*double(M);
P=padarray(P,1);
T=imfilter(P,avnp,'conv');
% figure,imshow(T),title('T');
M=padarray(M,1);
M=imfilter(M,avnp,'conv');
%  figure,imshow(M),title('M');
R=padarray(R,1);

R=imfilter(R,avnp,'conv');
%  figure,imshow(R),title('R');
L=padarray(L,1);
K=R.*double(L);
%  figure,imshow(K),title('K');

J=double(M)+double(K)-double(T);
J=uint8(J);
%  figure,imshow(J),title('J');

D3=double(J)./N;
D3=uint8(D3);
% figure,imshow(D3),title('D3');
DD=cat(3,D1,D2,D3);
figure,imshow(DD),title('Downscaled');

