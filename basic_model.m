close all
clear
clc

%% Image Pre-check
% dir = 'Data/NagoyaOrigami'; %Almost ¡¾NO¡¿ changes
% dir = 'Data/NagoyaDataLeading'; %Almost ¡¾NO¡¿ changes
% dir = 'Data/NagoyaFujita'; %¡¾GREEN MAT¡¿ spinning ¡¾CLOCKWISE¡¿ ¡¾A LITTLE¡¿

% dir = 'Data/Cam_Still'; %¡¾RIGHT KNIGHT¡¿ moving ¡¾RIGHT¡¿ ¡¾A LITTLE¡¿
% dir = 'Data/Toys'; %¡¾RED CAR¡¿ moving ¡¾RIGHT¡¿ ¡¾A LITTLE¡¿

% dir = 'Data/Trees'; %¡¾WHOLE SCENE¡¿ moving ¡¾RIGHT¡¿ ¡¾A LITTLE¡¿
dir = 'Data/Boys'; %¡¾BOYs¡¿ changing ¡¾GESTURE¡¿ ¡¾A LOT¡¿
% 
% %Multiview images of frame 1
% img1_ul = imread(strcat([dir '/R1.png'])); %up-left image of frame 1
% img1_uc = imread(strcat([dir '/R2.png'])); %up-center image of frame 1
% img1_ur = imread(strcat([dir '/R3.png'])); %up-right image of frame 1
% img1_ml = imread(strcat([dir '/R4.png'])); %middle-left image of frame 1
% img1_mc = imread(strcat([dir '/R5.png'])); %middle-center image of frame 1
% img1_mr = imread(strcat([dir '/R6.png'])); %middle-right image of frame 1
% img1_dl = imread(strcat([dir '/R7.png'])); %down-left image of frame 1
% img1_dc = imread(strcat([dir '/R8.png'])); %down-center image of frame 1 
% img1_dr = imread(strcat([dir '/R9.png'])); %down-right image of frame 1
% img1 = {img1_ul img1_uc img1_ur
%           img1_ml img1_mc img1_mr
%           img1_dl img1_dc img1_dr}';
% index1 = {'img1_{ul}' 'img1_{uc}' 'img1_{ur}'
%           'img1_{ml}' 'img1_{mc}' 'img1_{mr}'
%           'img1_{dl}' 'img1_{dc}' 'img1_{dr}'}';      
% %Multiview images of frame 2
% img2_ul = imread(strcat([dir '/R10.png'])); %up-left image of frame 2
% img2_uc = imread(strcat([dir '/R11.png'])); %up-center image of frame 2
% img2_ur = imread(strcat([dir '/R12.png'])); %up-right image of frame 2
% img2_ml = imread(strcat([dir '/R13.png'])); %middle-left image of frame 2
% img2_mc = imread(strcat([dir '/X.png']));   %middle-center image of frame 2 (only used in final evaluation)
% img2_mr = imread(strcat([dir '/R14.png'])); %middle-right image of frame 2
% img2_dl = imread(strcat([dir '/R15.png'])); %down-left image of frame 2
% img2_dc = imread(strcat([dir '/R16.png'])); %down-center image of frame 2
% img2_dr = imread(strcat([dir '/R17.png'])); %down-right image of frame 2
% img2 = {img2_ul img2_uc img2_ur
%           img2_ml img2_mc img2_mr
%           img2_dl img2_dc img2_dr}';
% index2 = {'img2_{ul}' 'img2_{uc}' 'img2_{ur}'
%           'img2_{ml}' 'img2_{mc}' 'img2_{mr}'
%           'img2_{dl}' 'img2_{dc}' 'img2_{dr}'}';
% figure(1)
% for i = 1:9
%     imshow(img1{i});
%     title(['Multiview Images: ' index1{i}])
%     pause(0.5);
% end
% for i = 1:9
%     imshow(img2{i});
%     title(['Multiview Images: ' index2{i}])
%     pause(0.5);
% end

%% Image Pre-processing
% dir = 'Data/NagoyaOrigami'; %Almost ¡¾NO¡¿ changes
box = 16;
%Multiview images of frame 1
img1_ul = imread(strcat([dir '/R1.png'])); %up-left image of frame 1
[row, col, channel] = size(img1_ul);

%Calculate the adding rows and columns
row_add = box - mod(row, box);
col_add = box - mod(col, box);

% img1_ul(row + 1:row + row_add, :, :) = 0;  img1_ul(:, col + 1:col + col_add, :) = 0; %paddling
% img1_ul_R = img1_ul(:, :, 1);img1_ul_R = im2double(img1_ul_R);
% img1_ul_G = img1_ul(:, :, 2);img1_ul_G = im2double(img1_ul_G);
% img1_ul_B = img1_ul(:, :, 3);img1_ul_B = im2double(img1_ul_B);

img1_uc = imread(strcat([dir '/R2.png'])); %up-center image of frame 1
img1_uc(row + 1:row + row_add, :, :) = 0;  img1_uc(:, col + 1:col + col_add, :) = 0; %paddling
img1_uc_R = img1_uc(:, :, 1);img1_uc_R = im2double(img1_uc_R);
img1_uc_G = img1_uc(:, :, 2);img1_uc_G = im2double(img1_uc_G);
img1_uc_B = img1_uc(:, :, 3);img1_uc_B = im2double(img1_uc_B);

% img1_ur = imread(strcat([dir '/R3.png'])); %up-right image of frame 1
% img1_ur(row + 1:row + row_add, :, :) = 0;  img1_ur(:, col + 1:col + col_add, :) = 0; %paddling
% img1_ur_R = img1_ur(:, :, 1);img1_ur_R = im2double(img1_ur_R);
% img1_ur_G = img1_ur(:, :, 2);img1_ur_G = im2double(img1_ur_G);
% img1_ur_B = img1_ur(:, :, 3);img1_ur_B = im2double(img1_ur_B);

img1_ml = imread(strcat([dir '/R4.png'])); %middle-left image of frame 1
img1_ml(row + 1:row + row_add, :, :) = 0;  img1_ml(:, col + 1:col + col_add, :) = 0; %paddling
img1_ml_R = img1_ml(:, :, 1);img1_ml_R = im2double(img1_ml_R);
img1_ml_G = img1_ml(:, :, 2);img1_ml_G = im2double(img1_ml_G);
img1_ml_B = img1_ml(:, :, 3);img1_ml_B = im2double(img1_ml_B);

img1_mc = imread(strcat([dir '/R5.png'])); %middle-center image of frame 1
img1_mc(row + 1:row + row_add, :, :) = 0;  img1_mc(:, col + 1:col + col_add, :) = 0; %paddling
img1_mc_R = img1_mc(:, :, 1);img1_mc_R = im2double(img1_mc_R);
img1_mc_G = img1_mc(:, :, 2);img1_mc_G = im2double(img1_mc_G);
img1_mc_B = img1_mc(:, :, 3);img1_mc_B = im2double(img1_mc_B);

img1_mr = imread(strcat([dir '/R6.png'])); %middle-right image of frame 1
img1_mr(row + 1:row + row_add, :, :) = 0;  img1_mr(:, col + 1:col + col_add, :) = 0; %paddling
img1_mr_R = img1_mr(:, :, 1);img1_mr_R = im2double(img1_mr_R);
img1_mr_G = img1_mr(:, :, 2);img1_mr_G = im2double(img1_mr_G);
img1_mr_B = img1_mr(:, :, 3);img1_mr_B = im2double(img1_mr_B);

% img1_dl = imread(strcat([dir '/R7.png'])); %down-left image of frame 1
% img1_dl(row + 1:row + row_add, :, :) = 0;  img1_dl(:, col + 1:col + col_add, :) = 0; %paddling
% img1_dl_R = img1_dl(:, :, 1);img1_dl_R = im2double(img1_dl_R);
% img1_dl_G = img1_dl(:, :, 2);img1_dl_G = im2double(img1_dl_G);
% img1_dl_B = img1_dl(:, :, 3);img1_dl_B = im2double(img1_dl_B);

img1_dc = imread(strcat([dir '/R8.png'])); %down-center image of frame 1 
img1_dc(row + 1:row + row_add, :, :) = 0;  img1_dc(:, col + 1:col + col_add, :) = 0; %paddling
img1_dc_R = img1_dc(:, :, 1);img1_dc_R = im2double(img1_dc_R);
img1_dc_G = img1_dc(:, :, 2);img1_dc_G = im2double(img1_dc_G);
img1_dc_B = img1_dc(:, :, 3);img1_dc_B = im2double(img1_dc_B);

% img1_dr = imread(strcat([dir '/R9.png'])); %down-right image of frame 1
% img1_dr(row + 1:row + row_add, :, :) = 0;  img1_dr(:, col + 1:col + col_add, :) = 0; %paddling
% img1_dr_R = img1_dr(:, :, 1);img1_dr_R = im2double(img1_dr_R);
% img1_dr_G = img1_dr(:, :, 2);img1_dr_G = im2double(img1_dr_G);
% img1_dr_B = img1_dr(:, :, 3);img1_dr_B = im2double(img1_dr_B);

%Multiview images of frame 2
% img2_ul = imread(strcat([dir '/R10.png'])); %up-left image of frame 2
% img2_ul(row + 1:row + row_add, :, :) = 0;  img2_ul(:, col + 1:col + col_add, :) = 0; %paddling
% img2_ul_R = img2_ul(:, :, 1);img2_ul_R = im2double(img2_ul_R);
% img2_ul_G = img2_ul(:, :, 2);img2_ul_G = im2double(img2_ul_G);
% img2_ul_B = img2_ul(:, :, 3);img2_ul_B = im2double(img2_ul_B);

img2_uc = imread(strcat([dir '/R11.png'])); %up-center image of frame 2
img2_uc(row + 1:row + row_add, :, :) = 0;  img2_uc(:, col + 1:col + col_add, :) = 0; %paddling
img2_uc_R = img2_uc(:, :, 1);img2_uc_R = im2double(img2_uc_R);
img2_uc_G = img2_uc(:, :, 2);img2_uc_G = im2double(img2_uc_G);
img2_uc_B = img2_uc(:, :, 3);img2_uc_B = im2double(img2_uc_B);

% img2_ur = imread(strcat([dir '/R12.png'])); %up-right image of frame 2
% img2_ur(row + 1:row + row_add, :, :) = 0;  img2_ur(:, col + 1:col + col_add, :) = 0; %paddling
% img2_ur_R = img2_ur(:, :, 1);img2_ur_R = im2double(img2_ur_R);
% img2_ur_G = img2_ur(:, :, 2);img2_ur_G = im2double(img2_ur_G);
% img2_ur_B = img2_ur(:, :, 3);img2_ur_B = im2double(img2_ur_B);

img2_ml = imread(strcat([dir '/R13.png'])); %middle-left image of frame 2
img2_ml(row + 1:row + row_add, :, :) = 0;  img2_ml(:, col + 1:col + col_add, :) = 0; %paddling
img2_ml_R = img2_ml(:, :, 1);img2_ml_R = im2double(img2_ml_R);
img2_ml_G = img2_ml(:, :, 2);img2_ml_G = im2double(img2_ml_G);
img2_ml_B = img2_ml(:, :, 3);img2_ml_B = im2double(img2_ml_B);

img2_mc = imread(strcat([dir '/X.png']));   %middle-center image of frame 2 (ONLY used in final evaluation)
img2_mc(row + 1:row + row_add, :, :) = 0;  
img2_mc(:, col + 1:col + col_add, :) = 0; %paddling
% img2_mc_R = img2_mc(:, :, 1);
% img2_mc_G = img2_mc(:, :, 2);
% img2_mc_B = img2_mc(:, :, 3);

img2_mr = imread(strcat([dir '/R14.png'])); %middle-right image of frame 2
img2_mr(row + 1:row + row_add, :, :) = 0;  img2_mr(:, col + 1:col + col_add, :) = 0; %paddling
img2_mr_R = img2_mr(:, :, 1);img2_mr_R = im2double(img2_mr_R);
img2_mr_G = img2_mr(:, :, 2);img2_mr_G = im2double(img2_mr_G);
img2_mr_B = img2_mr(:, :, 3);img2_mr_B = im2double(img2_mr_B);

% img2_dl = imread(strcat([dir '/R15.png'])); %down-left image of frame 2
% img2_dl(row + 1:row + row_add, :, :) = 0;  img2_dl(:, col + 1:col + col_add, :) = 0; %paddling
% img2_dl_R = img2_dl(:, :, 1);img2_dl_R = im2double(img2_dl_R);
% img2_dl_G = img2_dl(:, :, 2);img2_dl_G = im2double(img2_dl_G);
% img2_dl_B = img2_dl(:, :, 3);img2_dl_B = im2double(img2_dl_B);

img2_dc = imread(strcat([dir '/R16.png'])); %down-center image of frame 2
img2_dc(row + 1:row + row_add, :, :) = 0;  img2_dc(:, col + 1:col + col_add, :) = 0; %paddling
img2_dc_R = img2_dc(:, :, 1);img2_dc_R = im2double(img2_dc_R);
img2_dc_G = img2_dc(:, :, 2);img2_dc_G = im2double(img2_dc_G);
img2_dc_B = img2_dc(:, :, 3);img2_dc_B = im2double(img2_dc_B);

% img2_dr = imread(strcat([dir '/R17.png'])); %down-right image of frame 2
% img2_dr(row + 1:row + row_add, :, :) = 0;  img2_dr(:, col + 1:col + col_add, :) = 0; %paddling
% img2_dr_R = img2_dr(:, :, 1);img2_dr_R = im2double(img2_dr_R);
% img2_dr_G = img2_dr(:, :, 2);img2_dr_G = im2double(img2_dr_G);
% img2_dr_B = img2_dr(:, :, 3);img2_dr_B = im2double(img2_dr_B);

%Analyzing image differences in separated channels
% Images of frame 1
% img1_ul_diffR = img1_mc_R - img1_ul_R;
% img1_ul_diffG = img1_mc_G - img1_ul_G;
% img1_ul_diffB = img1_mc_B - img1_ul_B;

img1_uc_diff_R = img1_mc_R - img1_uc_R;
img1_uc_diff_G = img1_mc_G - img1_uc_G;
img1_uc_diff_B = img1_mc_B - img1_uc_B;

% img1_ur_diffR = img1_mc_R - img1_ur_R;
% img1_ur_diffG = img1_mc_G - img1_ur_G;
% img1_ur_diffB = img1_mc_B - img1_ur_B;

img1_ml_diff_R = img1_mc_R - img1_ml_R;
img1_ml_diff_G = img1_mc_G - img1_ml_G;
img1_ml_diff_B = img1_mc_B - img1_ml_B;

img1_mr_diff_R = img1_mc_R - img1_mr_R;
img1_mr_diff_G = img1_mc_G - img1_mr_G;
img1_mr_diff_B = img1_mc_B - img1_mr_B;

% img1_dl_diffR = img1_mc_R - img1_dl_R;
% img1_dl_diffG = img1_mc_G - img1_dl_G;
% img1_dl_diffB = img1_mc_B - img1_dl_B;

img1_dc_diff_R = img1_mc_R - img1_dc_R;
img1_dc_diff_G = img1_mc_G - img1_dc_G;
img1_dc_diff_B = img1_mc_B - img1_dc_B;

% img1_dr_diffR = img1_mc_R - img1_dr_R;
% img1_dr_diffG = img1_mc_G - img1_dr_G;
% img1_dr_diffB = img1_mc_B - img1_dr_B;

%% Cvx opt model for Data/NagoyaOrigami
tic
img2_mc_R_pred = zeros(size(img1_mc_R));
img2_mc_G_pred = img2_mc_R_pred;
img2_mc_B_pred = img2_mc_R_pred;
rowb = ceil(row/box);
colb = ceil(col/box);
%R channel
for j = 1:colb
    for i = 1:rowb
%         ref_ul_diffR = img1_ul_diffR(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_uc_diff_R = img1_uc_diff_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_ur_diffR = img1_ur_diffR(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_ml_diff_R = img1_ml_diff_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_mr_diff_R = img1_mr_diff_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_dl_diffR = img1_dl_diffR(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_dc_diff_R = img1_dc_diff_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_dr_diffR = img1_dr_diffR(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        
%         ref_ul_R = img2_ul_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ul_diffR;
        ref_uc_R = img2_uc_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_uc_diff_R;
%         ref_ur_R = img2_ur_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ur_diffR;
        ref_ml_R = img2_ml_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ml_diff_R;
        ref_mr_R = img2_mr_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_mr_diff_R;
%         ref_dl_R = img2_dl_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dl_diffR;
        ref_dc_R = img2_dc_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dc_diff_R;
%         ref_dr_R = img2_dr_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dr_diffR;
        block = zeros(box, box);
        
        cvx_begin quiet
        variables block(box, box);
        minimize f0(block, ref_uc_R, ref_ml_R, ref_mr_R, ref_dc_R, 3)
        subject to
            block >= 0;
            block <= 1;
        cvx_end
        
        disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in R channel finished']);        
        img2_mc_R_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block;
    end
end
%G channel
for j = 1:colb
    for i = 1:rowb
%         ref_ul_diffG = img1_ul_diffG(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_uc_diffG = img1_uc_diff_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_ur_diffG = img1_ur_diffG(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_ml_diffG = img1_ml_diff_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_mr_diffG = img1_mr_diff_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_dl_diffG = img1_dl_diffG(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_dc_diffG = img1_dc_diff_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_dr_diffG = img1_dr_diffG(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        
%         ref_ul_G = img2_ul_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ul_diffG;
        ref_uc_G = img2_uc_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_uc_diffG;
%         ref_ur_G = img2_ur_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ur_diffG;
        ref_ml_G = img2_ml_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ml_diffG;
        ref_mr_G = img2_mr_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_mr_diffG;
%         ref_dl_G = img2_dl_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dl_diffG;
        ref_dc_G = img2_dc_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dc_diffG;
%         ref_dr_G = img2_dr_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dr_diffG;
        block = zeros(box, box);
        
        cvx_begin quiet
        variables block(box, box);
        minimize f0(block, ref_uc_G, ref_ml_G, ref_mr_G, ref_dc_G, 3)
        subject to
            block >= 0;
            block <= 1;
        cvx_end
        
        disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in G channel finished']);        
        img2_mc_G_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block;
    end
end
%B channel
for j = 1:colb
    for i = 1:rowb
%         ref_ul_diffB = img1_ul_diffB(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_uc_diffB = img1_uc_diff_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_ur_diffB = img1_ur_diffB(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_ml_diffB = img1_ml_diff_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_mr_diffB = img1_mr_diff_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_dl_diffB = img1_dl_diffB(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        ref_dc_diffB = img1_dc_diff_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
%         ref_dr_diffB = img1_dr_diffB(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        
%         ref_ul_B = img2_ul_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ul_diffB;
        ref_uc_B = img2_uc_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_uc_diffB;
%         ref_ur_B = img2_ur_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ur_diffB;
        ref_ml_B = img2_ml_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ml_diffB;
        ref_mr_B = img2_mr_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_mr_diffB;
%         ref_dl_B = img2_dl_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dl_diffB;
        ref_dc_B = img2_dc_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dc_diffB;
%         ref_dr_B = img2_dr_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dr_diffB;
        block = zeros(box, box);
        
        cvx_begin quiet
        variables block(box, box);
        minimize f0(block, ref_uc_B, ref_ml_B, ref_mr_B, ref_dc_B, 3)
        subject to
            block >= 0;
            block <= 1;
        cvx_end
        
        disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in B channel finished']);        
        img2_mc_B_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block;
    end
end

img2_mc_pred(:, :, 1) = 255 * img2_mc_R_pred;
img2_mc_pred(:, :, 2) = 255 * img2_mc_G_pred;
img2_mc_pred(:, :, 3) = 255 * img2_mc_B_pred;
img2_mc_pred = uint8(img2_mc_pred);
img2_mc = img2_mc(1:row, 1:col, :);
img2_mc_pred = img2_mc_pred(1:row, 1:col, :);
toc
time = toc;
%% Model Evaluation
PSNR_R = psnr(img2_mc(:, :, 1), img2_mc_pred(:,:, 1));
PSNR_G = psnr(img2_mc(:, :, 2), img2_mc_pred(:,:, 2));
PSNR_B = psnr(img2_mc(:, :, 3), img2_mc_pred(:,:, 3));
PSNR = 1/3 * (PSNR_R + PSNR_G + PSNR_B);
figure(5)
subplot(121)
imshow(img2_mc)
title('Frame 2 center image: X','fontsize', 24)
xlabel(['Overall Running Time: ', num2str(time), 's'], 'fontsize',24)
subplot(122)
imshow(img2_mc_pred)
title('Frame 2 center image: Predicted X','fontsize',24)
xlabel(['PSNR of predicted ' dir ' center image: ' num2str(PSNR)],'fontsize',24)
disp(['PSNR of predicted ' dir ' center image: ' num2str(PSNR)]);