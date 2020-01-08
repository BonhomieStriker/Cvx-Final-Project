clear; clc;
%% Pre-processing
% dir = 'Data/NagoyaOrigami';       left_devia = 1;  right_devia = 1; up_devia = 1;  down_devia = 1;
dir = 'Data/NagoyaDataLeading';   left_devia = 2;  right_devia = 2; up_devia = 2;  down_devia = 2;
% dir = 'Data/NagoyaFujita';        left_devia = 1;  right_devia = 1; up_devia = 1;  down_devia = 1;

% dir = 'Data/Cam_Still';           left_devia = 1;  right_devia = 1; up_devia = 2;  down_devia = 2;
% dir = 'Data/Toys';                left_devia = 0;  right_devia = 0; up_devia = 0;  down_devia = 0;

% dir = 'Data/Trees';               left_devia = 1;  right_devia = 1; up_devia = 0;  down_devia = 0;
% dir = 'Data/Boys';                  left_devia = 6;  right_devia = 6; up_devia = 6;  down_devia = 6;

box = 64; % partition box size 64*64 or 16*16
%%
% Multiview images of frame 1
img1_ul = imread(strcat([dir '/R1.png'])); %up-left image of frame 1
img1_uc = imread(strcat([dir '/R2.png'])); %up-center image of frame 1
img1_ur = imread(strcat([dir '/R3.png'])); %up-right image of frame 1
img1_ml = imread(strcat([dir '/R4.png'])); %middle-left image of frame 1
img1_mc = imread(strcat([dir '/R5.png'])); %middle-center image of frame 1
img1_mr = imread(strcat([dir '/R6.png'])); %middle-right image of frame 1
img1_dl = imread(strcat([dir '/R7.png'])); %down-left image of frame 1
img1_dc = imread(strcat([dir '/R8.png'])); %down-center image of frame 1 
img1_dr = imread(strcat([dir '/R9.png'])); %down-right image of frame

img2_ul = imread(strcat([dir '/R10.png'])); %up-left image of frame 1
img2_uc = imread(strcat([dir '/R11.png'])); %up-center image of frame 1
img2_ur = imread(strcat([dir '/R12.png'])); %up-right image of frame 1
img2_ml = imread(strcat([dir '/R13.png'])); %middle-left image of frame 1
img2_mc = imread(strcat([dir '/X.png'])); %middle-center image of frame 1
img2_mr = imread(strcat([dir '/R14.png'])); %middle-right image of frame 1
img2_dl = imread(strcat([dir '/R15.png'])); %down-left image of frame 1
img2_dc = imread(strcat([dir '/R16.png'])); %down-center image of frame 1 
img2_dr = imread(strcat([dir '/R17.png'])); %down-right image of frame

[row,col,channel] = size(img2_mc);
% R channel
img1_uc_R = im2double(img1_uc(:, :, 1)); 
img1_ml_R = im2double(img1_ml(:, :, 1));
img1_mc_R = im2double(img1_mc(:, :, 1));
img1_mr_R = im2double(img1_mr(:, :, 1));
img1_dc_R = im2double(img1_dc(:, :, 1));

img2_uc_R = im2double(img2_uc(:, :, 1));
img2_ml_R = im2double(img2_ml(:, :, 1));
img2_mc_R = im2double(img2_mc(:, :, 1));
img2_mr_R = im2double(img2_mr(:, :, 1));
img2_dc_R = im2double(img2_dc(:, :, 1));

% G channel
img1_uc_G = im2double(img1_uc(:, :, 2)); 
img1_ml_G = im2double(img1_ml(:, :, 2));
img1_mc_G = im2double(img1_mc(:, :, 2));
img1_mr_G = im2double(img1_mr(:, :, 2));
img1_dc_G = im2double(img1_dc(:, :, 2));

img2_uc_G = im2double(img2_uc(:, :, 2));
img2_ml_G = im2double(img2_ml(:, :, 2));
img2_mc_G = im2double(img2_mc(:, :, 2));
img2_mr_G = im2double(img2_mr(:, :, 2));
img2_dc_G = im2double(img2_dc(:, :, 2));

% B channel
img1_uc_B = im2double(img1_uc(:, :, 3)); 
img1_ml_B = im2double(img1_ml(:, :, 3));
img1_mc_B = im2double(img1_mc(:, :, 3));
img1_mr_B = im2double(img1_mr(:, :, 3));
img1_dc_B = im2double(img1_dc(:, :, 3));

img2_uc_B = im2double(img2_uc(:, :, 3));
img2_ml_B = im2double(img2_ml(:, :, 3));
img2_mc_B = im2double(img2_mc(:, :, 3));
img2_mr_B = im2double(img2_mr(:, :, 3));
img2_dc_B = im2double(img2_dc(:, :, 3));
%% Eliminate the deviation of uc&ml&mr&dc images 
% R channel
img1_uc_R_devia = zeros(row, col);  img1_ml_R_devia = zeros(row, col);
img1_mr_R_devia = zeros(row, col);  img1_dc_R_devia = zeros(row, col);
img2_uc_R_devia = zeros(row, col);  img2_ml_R_devia = zeros(row, col);
img2_mr_R_devia = zeros(row, col);  img2_dc_R_devia = zeros(row, col);

% G channel
img1_uc_G_devia = zeros(row, col);  img1_ml_G_devia = zeros(row, col);
img1_mr_G_devia = zeros(row, col);  img1_dc_G_devia = zeros(row, col);
img2_uc_G_devia = zeros(row, col);  img2_ml_G_devia = zeros(row, col);
img2_mr_G_devia = zeros(row, col);  img2_dc_G_devia = zeros(row, col);

% B channel
img1_uc_B_devia = zeros(row, col);  img1_ml_B_devia = zeros(row, col);
img1_mr_B_devia = zeros(row, col);  img1_dc_B_devia = zeros(row, col);
img2_uc_B_devia = zeros(row, col);  img2_ml_B_devia = zeros(row, col);
img2_mr_B_devia = zeros(row, col);  img2_dc_B_devia = zeros(row, col);

% Use the corresponding part of frame 1 for deviation correction
% frame 1
% R channel
img1_uc_R_devia(1:row-up_devia, :) = img1_uc_R(up_devia+1:row, :);
img1_uc_R_devia(row-up_devia+1:row, :) = img1_mc_R(row-up_devia+1:row, :);
img1_ml_R_devia(:, 1:col-left_devia) = img1_ml_R(:, left_devia+1:col);
img1_ml_R_devia(:, col-left_devia+1:col) = img1_mc_R(:, col-left_devia+1:col);
img1_mr_R_devia(:, right_devia+1:col) = img1_mr_R(:, 1:col-right_devia);
img1_mr_R_devia(:, 1:right_devia) = img1_mc_R(:, 1:right_devia);
img1_dc_R_devia(down_devia+1:row, :) = img1_dc_R(1:row-down_devia, :);
img1_dc_R_devia(1:down_devia, :) = img1_mc_R(1:down_devia, :);

img1_mc_R_devia = img1_mc_R;

% G channel
img1_uc_G_devia(1:row-up_devia, :) = img1_uc_G(up_devia+1:row, :);
img1_uc_G_devia(row-up_devia+1:row, :) = img1_mc_G(row-up_devia+1:row, :);
img1_ml_G_devia(:, 1:col-left_devia) = img1_ml_G(:, left_devia+1:col);
img1_ml_G_devia(:, col-left_devia+1:col) = img1_mc_G(:, col-left_devia+1:col);
img1_mr_G_devia(:, right_devia+1:col) = img1_mr_G(:, 1:col-right_devia);
img1_mr_G_devia(:, 1:right_devia) = img1_mc_G(:, 1:right_devia);
img1_dc_G_devia(down_devia+1:row, :) = img1_dc_G(1:row-down_devia, :);
img1_dc_G_devia(1:down_devia, :) = img1_mc_G(1:down_devia, :);

img1_mc_G_devia = img1_mc_G;

% B channel
img1_uc_B_devia(1:row-up_devia, :) = img1_uc_B(up_devia+1:row, :);
img1_uc_B_devia(row-up_devia+1:row, :) = img1_mc_B(row-up_devia+1:row, :);
img1_ml_B_devia(:, 1:col-left_devia) = img1_ml_B(:, left_devia+1:col);
img1_ml_B_devia(:, col-left_devia+1:col) = img1_mc_B(:, col-left_devia+1:col);
img1_mr_B_devia(:, right_devia+1:col) = img1_mr_B(:, 1:col-right_devia);
img1_mr_B_devia(:, 1:right_devia) = img1_mc_B(:, 1:right_devia);
img1_dc_B_devia(down_devia+1:row, :) = img1_dc_B(1:row-down_devia, :);
img1_dc_B_devia(1:down_devia, :) = img1_mc_B(1:down_devia, :);

img1_mc_B_devia = img1_mc_B;

% frame 2
% R channel
img2_uc_R_devia(1:row-up_devia, :) = img2_uc_R(up_devia+1:row, :);
img2_uc_R_devia(row-up_devia+1:row, :) = img1_mc_R(row-up_devia+1:row, :);
img2_ml_R_devia(:, 1:col-left_devia) = img2_ml_R(:, left_devia+1:col);
img2_ml_R_devia(:, col-left_devia+1:col) = img1_mc_R(:, col-left_devia+1:col);
img2_mr_R_devia(:, right_devia+1:col) = img2_mr_R(:, 1:col-right_devia);
img2_mr_R_devia(:, 1:right_devia) = img1_mc_R(:, 1:right_devia);
img2_dc_R_devia(down_devia+1:row, :) = img2_dc_R(1:row-down_devia, :);
img2_dc_R_devia(1:down_devia, :) = img1_mc_R(1:down_devia, :);

% G channel
img2_uc_G_devia(1:row-up_devia, :) = img2_uc_G(up_devia+1:row, :);
img2_uc_G_devia(row-up_devia+1:row, :) = img1_mc_G(row-up_devia+1:row, :);
img2_ml_G_devia(:, 1:col-left_devia) = img2_ml_G(:, left_devia+1:col);
img2_ml_G_devia(:, col-left_devia+1:col) = img1_mc_G(:, col-left_devia+1:col);
img2_mr_G_devia(:, right_devia+1:col) = img2_mr_G(:, 1:col-right_devia);
img2_mr_G_devia(:, 1:right_devia) = img1_mc_G(:, 1:right_devia);
img2_dc_G_devia(down_devia+1:row, :) = img2_dc_G(1:row-down_devia, :);
img2_dc_G_devia(1:down_devia, :) = img1_mc_G(1:down_devia, :);

% B channel
img2_uc_B_devia(1:row-up_devia, :) = img2_uc_B(up_devia+1:row, :);
img2_uc_B_devia(row-up_devia+1:row, :) = img1_mc_B(row-up_devia+1:row, :);
img2_ml_B_devia(:, 1:col-left_devia) = img2_ml_B(:, left_devia+1:col);
img2_ml_B_devia(:, col-left_devia+1:col) = img1_mc_B(:, col-left_devia+1:col);
img2_mr_B_devia(:, right_devia+1:col) = img2_mr_B(:, 1:col-right_devia);
img2_mr_B_devia(:, 1:right_devia) = img1_mc_B(:, 1:right_devia);
img2_dc_B_devia(down_devia+1:row, :) = img2_dc_B(1:row-down_devia, :);
img2_dc_B_devia(1:down_devia, :) = img1_mc_B(1:down_devia, :);

%% Paddling to suit for box
% Paddling increments
if mod(row,box) ~= 0
    row_add = box - mod(row, box);
else
    row_add = 0;
end
if mod(col,box) ~= 0
    col_add = box - mod(col, box);
else
    col_add = 0;
end
% Paddling for R channel
img1_uc_R_devia(row + 1:row + row_add, :, :) = 0;  img1_uc_R_devia(:, col + 1:col + col_add, :) = 0;
img2_uc_R_devia(row + 1:row + row_add, :, :) = 0;  img2_uc_R_devia(:, col + 1:col + col_add, :) = 0;

img1_ml_R_devia(row + 1:row + row_add, :, :) = 0;  img1_ml_R_devia(:, col + 1:col + col_add, :) = 0;
img2_ml_R_devia(row + 1:row + row_add, :, :) = 0;  img2_ml_R_devia(:, col + 1:col + col_add, :) = 0;

img1_mr_R_devia(row + 1:row + row_add, :, :) = 0;  img1_mr_R_devia(:, col + 1:col + col_add, :) = 0;
img2_mr_R_devia(row + 1:row + row_add, :, :) = 0;  img2_mr_R_devia(:, col + 1:col + col_add, :) = 0;

img1_dc_R_devia(row + 1:row + row_add, :, :) = 0;  img1_dc_R_devia(:, col + 1:col + col_add, :) = 0;
img2_dc_R_devia(row + 1:row + row_add, :, :) = 0;  img2_dc_R_devia(:, col + 1:col + col_add, :) = 0;

img1_mc_R_devia(row + 1:row + row_add, :, :) = 0;  img1_mc_R_devia(:, col + 1:col + col_add, :) = 0;

% Paddling for G channel
img1_uc_G_devia(row + 1:row + row_add, :, :) = 0;  img1_uc_G_devia(:, col + 1:col + col_add, :) = 0;
img2_uc_G_devia(row + 1:row + row_add, :, :) = 0;  img2_uc_G_devia(:, col + 1:col + col_add, :) = 0;

img1_ml_G_devia(row + 1:row + row_add, :, :) = 0;  img1_ml_G_devia(:, col + 1:col + col_add, :) = 0;
img2_ml_G_devia(row + 1:row + row_add, :, :) = 0;  img2_ml_G_devia(:, col + 1:col + col_add, :) = 0;

img1_mr_G_devia(row + 1:row + row_add, :, :) = 0;  img1_mr_G_devia(:, col + 1:col + col_add, :) = 0;
img2_mr_G_devia(row + 1:row + row_add, :, :) = 0;  img2_mr_G_devia(:, col + 1:col + col_add, :) = 0;

img1_dc_G_devia(row + 1:row + row_add, :, :) = 0;  img1_dc_G_devia(:, col + 1:col + col_add, :) = 0;
img2_dc_G_devia(row + 1:row + row_add, :, :) = 0;  img2_dc_G_devia(:, col + 1:col + col_add, :) = 0;

img1_mc_G_devia(row + 1:row + row_add, :, :) = 0;  img1_mc_G_devia(:, col + 1:col + col_add, :) = 0;

% Paddling for B channel
img1_uc_B_devia(row + 1:row + row_add, :, :) = 0;  img1_uc_B_devia(:, col + 1:col + col_add, :) = 0;
img2_uc_B_devia(row + 1:row + row_add, :, :) = 0;  img2_uc_B_devia(:, col + 1:col + col_add, :) = 0;

img1_ml_B_devia(row + 1:row + row_add, :, :) = 0;  img1_ml_B_devia(:, col + 1:col + col_add, :) = 0;
img2_ml_B_devia(row + 1:row + row_add, :, :) = 0;  img2_ml_B_devia(:, col + 1:col + col_add, :) = 0;

img1_mr_B_devia(row + 1:row + row_add, :, :) = 0;  img1_mr_B_devia(:, col + 1:col + col_add, :) = 0;
img2_mr_B_devia(row + 1:row + row_add, :, :) = 0;  img2_mr_B_devia(:, col + 1:col + col_add, :) = 0;

img1_dc_B_devia(row + 1:row + row_add, :, :) = 0;  img1_dc_B_devia(:, col + 1:col + col_add, :) = 0;
img2_dc_B_devia(row + 1:row + row_add, :, :) = 0;  img2_dc_B_devia(:, col + 1:col + col_add, :) = 0;

img1_mc_B_devia(row + 1:row + row_add, :, :) = 0;  img1_mc_B_devia(:, col + 1:col + col_add, :) = 0;

%% Image segmentation for changed object
% R channel
img_uc_diff_R = (img2_uc_R_devia - img1_uc_R_devia);
img_ml_diff_R = (img2_ml_R_devia - img1_ml_R_devia);
img_mr_diff_R = (img2_mr_R_devia - img1_mr_R_devia);
img_dc_diff_R = (img2_dc_R_devia - img1_dc_R_devia);

% G channel
img_uc_diff_G = (img2_uc_G_devia - img1_uc_G_devia);
img_ml_diff_G = (img2_ml_G_devia - img1_ml_G_devia);
img_mr_diff_G = (img2_mr_G_devia - img1_mr_G_devia);
img_dc_diff_G = (img2_dc_G_devia - img1_dc_G_devia);

% B channel
img_uc_diff_B = (img2_uc_B_devia - img1_uc_B_devia);
img_ml_diff_B = (img2_ml_B_devia - img1_ml_B_devia);
img_mr_diff_B = (img2_mr_B_devia - img1_mr_B_devia);
img_dc_diff_B = (img2_dc_B_devia - img1_dc_B_devia);

threshold = 0.08;  num = box / 2;
% R channel
index_uc_diff_R = img_seg(img_uc_diff_R, box, threshold, num);
index_ml_diff_R = img_seg(img_ml_diff_R, box, threshold, num);
index_mr_diff_R = img_seg(img_mr_diff_R, box, threshold, num);
index_dc_diff_R = img_seg(img_dc_diff_R, box, threshold, num);
% index indicates the changed object by setting 1 in the corresponding row & col
index_R = index_uc_diff_R | index_ml_diff_R | index_mr_diff_R | index_dc_diff_R;

% G channel
index_uc_diff_G = img_seg(img_uc_diff_G, box, threshold, num);
index_ml_diff_G = img_seg(img_ml_diff_G, box, threshold, num);
index_mr_diff_G = img_seg(img_mr_diff_G, box, threshold, num);
index_dc_diff_G = img_seg(img_dc_diff_G, box, threshold, num);
% index indicates the changed object by setting 1 in the corresponding row & col
index_G = index_uc_diff_G | index_ml_diff_G | index_mr_diff_G | index_dc_diff_G;

% B channel
index_uc_diff_B = img_seg(img_uc_diff_B, box, threshold, num);
index_ml_diff_B = img_seg(img_ml_diff_B, box, threshold, num);
index_mr_diff_B = img_seg(img_mr_diff_B, box, threshold, num);
index_dc_diff_B = img_seg(img_dc_diff_B, box, threshold, num);
% index indicates the changed object by setting 1 in the corresponding row & col
index_B = index_uc_diff_B | index_ml_diff_B | index_mr_diff_B | index_dc_diff_B;
%% Optimize the prediction of changed object (segmented)
% R channel
img1_uc_R_changed = img1_uc_R_devia .* index_R;  img1_ml_R_changed = img1_ml_R_devia .* index_R;
img1_mr_R_changed = img1_mr_R_devia .* index_R;  img1_dc_R_changed = img1_dc_R_devia .* index_R;
img1_mc_R_changed = img1_mc_R_devia .* index_R;
img2_uc_R_changed = img2_uc_R_devia .* index_R;  img2_ml_R_changed = img2_ml_R_devia .* index_R;
img2_mr_R_changed = img2_mr_R_devia .* index_R;  img2_dc_R_changed = img2_dc_R_devia .* index_R;

% G channel
img1_uc_G_changed = img1_uc_G_devia .* index_G;  img1_ml_G_changed = img1_ml_G_devia .* index_G;
img1_mr_G_changed = img1_mr_G_devia .* index_G;  img1_dc_G_changed = img1_dc_G_devia .* index_G;
img1_mc_G_changed = img1_mc_G_devia .* index_G;
img2_uc_G_changed = img2_uc_G_devia .* index_G;  img2_ml_G_changed = img2_ml_G_devia .* index_G;
img2_mr_G_changed = img2_mr_G_devia .* index_G;  img2_dc_G_changed = img2_dc_G_devia .* index_G;

% B channel
img1_uc_B_changed = img1_uc_B_devia .* index_B;  img1_ml_B_changed = img1_ml_B_devia .* index_B;
img1_mr_B_changed = img1_mr_B_devia .* index_B;  img1_dc_B_changed = img1_dc_B_devia .* index_B;
img1_mc_B_changed = img1_mc_B_devia .* index_B;
img2_uc_B_changed = img2_uc_B_devia .* index_B;  img2_ml_B_changed = img2_ml_B_devia .* index_B;
img2_mr_B_changed = img2_mr_B_devia .* index_B;  img2_dc_B_changed = img2_dc_B_devia .* index_B;

tic
for j = 1:ceil(col/box)
   for i = 1:ceil(row/box)
       % R channel
        if index_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) == zeros(box, box)
            img2_mc_R_changed_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = zeros(box, box);
        else
            ref_uc_R = img2_uc_R_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_ml_R = img2_ml_R_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_mr_R = img2_mr_R_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_dc_R = img2_dc_R_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            block_R = zeros(box, box);
      
            cvx_begin quiet
            variables block_R(box, box);
            minimize f2(block_R, ref_uc_R, ref_ml_R, ref_mr_R, ref_dc_R, 3)
            subject to
                block_R >= 0;
                block_R <= 1;
            cvx_end

            disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in R channel finished']); 
            img2_mc_R_changed_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block_R;
        end
        
        % G channel
        if index_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) == zeros(box, box)
            img2_mc_G_changed_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = zeros(box, box);
        else
            ref_uc_G = img2_uc_G_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_ml_G = img2_ml_G_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_mr_G = img2_mr_G_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_dc_G = img2_dc_G_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            block_G = zeros(box, box);
        
            cvx_begin quiet
            variables block_G(box, box);
            minimize f2(block_G, ref_uc_G, ref_ml_G, ref_mr_G, ref_dc_G, 3)
            subject to
                block_G >= 0;
                block_G <= 1;
            cvx_end

            disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in G channel finished']); 
            img2_mc_G_changed_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block_G;
        end
        
        % B channel
        if index_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) == zeros(box, box)
            img2_mc_B_changed_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = zeros(box, box);  
        else
            ref_uc_B = img2_uc_B_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_ml_B = img2_ml_B_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_mr_B = img2_mr_B_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_dc_B = img2_dc_B_changed(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            block_B = zeros(box, box);
        
            cvx_begin quiet
            variables block_B(box, box);
            minimize f2(block_B, ref_uc_B, ref_ml_B, ref_mr_B, ref_dc_B, 3)
            subject to
                block_B >= 0;
                block_B <= 1;
            cvx_end

            disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in B channel finished']); 
            img2_mc_B_changed_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block_B;
        end
   end
end

%% Optimize the unchanged part (segmented)
img1_uc_R_unchanged = img1_uc_R_devia .* (1 - index_R);  img1_ml_R_unchanged = img1_ml_R_devia .* (1 - index_R);
img1_mr_R_unchanged = img1_mr_R_devia .* (1 - index_R);  img1_dc_R_unchanged = img1_dc_R_devia .* (1 - index_R);
img1_mc_R_unchanged = img1_mc_R_devia .* (1 - index_R);

img1_uc_G_unchanged = img1_uc_G_devia .* (1 - index_G);  img1_ml_G_unchanged = img1_ml_G_devia .* (1 - index_G);
img1_mr_G_unchanged = img1_mr_G_devia .* (1 - index_G);  img1_dc_G_unchanged = img1_dc_G_devia .* (1 - index_G);
img1_mc_G_unchanged = img1_mc_G_devia .* (1 - index_G);

img1_uc_B_unchanged = img1_uc_B_devia .* (1 - index_B);  img1_ml_B_unchanged = img1_ml_B_devia .* (1 - index_B);
img1_mr_B_unchanged = img1_mr_B_devia .* (1 - index_B);  img1_dc_B_unchanged = img1_dc_B_devia .* (1 - index_B);
img1_mc_B_unchanged = img1_mc_B_devia .* (1 - index_B);

img2_uc_R_unchanged = img2_uc_R_devia .* (1 - index_R);  img2_ml_R_unchanged = img2_ml_R_devia .* (1 - index_R);
img2_mr_R_unchanged = img2_mr_R_devia .* (1 - index_R);  img2_dc_R_unchanged = img2_dc_R_devia .* (1 - index_R);

img2_uc_G_unchanged = img2_uc_G_devia .* (1 - index_G);  img2_ml_G_unchanged = img2_ml_G_devia .* (1 - index_G);
img2_mr_G_unchanged = img2_mr_G_devia .* (1 - index_G);  img2_dc_G_unchanged = img2_dc_G_devia .* (1 - index_G);

img2_uc_B_unchanged = img2_uc_B_devia .* (1 - index_B);  img2_ml_B_unchanged = img2_ml_B_devia .* (1 - index_B);
img2_mr_B_unchanged = img2_mr_B_devia .* (1 - index_B);  img2_dc_B_unchanged = img2_dc_B_devia .* (1 - index_B);

img_uc_diff_R_unchanged = img_uc_diff_R .* (1 - index_R);
img_ml_diff_R_unchanged = img_ml_diff_R .* (1 - index_R);
img_mr_diff_R_unchanged = img_mr_diff_R .* (1 - index_R);
img_dc_diff_R_unchanged = img_dc_diff_R .* (1 - index_R); 

img_uc_diff_G_unchanged = img_uc_diff_G .* (1 - index_G);
img_ml_diff_G_unchanged = img_ml_diff_G .* (1 - index_G);
img_mr_diff_G_unchanged = img_mr_diff_G .* (1 - index_G);
img_dc_diff_G_unchanged = img_dc_diff_G .* (1 - index_G); 

img_uc_diff_B_unchanged = img_uc_diff_B .* (1 - index_B);
img_ml_diff_B_unchanged = img_ml_diff_B .* (1 - index_B);
img_mr_diff_B_unchanged = img_mr_diff_B .* (1 - index_B);
img_dc_diff_B_unchanged = img_dc_diff_B .* (1 - index_B); 

for j = 1:ceil(col/box)
    for i = 1:ceil(row/box)
        % R channel
        if index_R(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) == ones(box, box)
            img2_mc_R_unchanged_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = zeros(box, box);
        else
            ref_uc_R = img_uc_diff_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_ml_R = img_ml_diff_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_mr_R = img_mr_diff_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_dc_R = img_dc_diff_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            im2_uc_R = img2_uc_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_ml_R = img2_ml_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_mr_R = img2_mr_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_dc_R = img2_dc_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            img2_uc_R_unchanged_pred = img1_mc_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_uc_R;
            img2_ml_R_unchanged_pred = img1_mc_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ml_R;
            img2_mr_R_unchanged_pred = img1_mc_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_mr_R;
            img2_dc_R_unchanged_pred = img1_mc_R_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dc_R;
            
            block_R = zeros(box, box);
        
            cvx_begin quiet
            variables block_R(box, box);
            minimize f1(block_R, img2_uc_R_unchanged_pred, img2_ml_R_unchanged_pred, img2_mr_R_unchanged_pred, img2_dc_R_unchanged_pred, im2_uc_R, im2_ml_R, im2_mr_R, im2_dc_R, 3)
            subject to
                block_R >= 0;
                block_R <= 1;
            cvx_end

            disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in R channel finished']); 
            img2_mc_R_unchanged_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block_R;
        end
        
        % G channel
        if index_G(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) == ones(box, box)
            img2_mc_G_unchanged_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = zeros(box, box);
        else
            ref_uc_G = img_uc_diff_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_ml_G = img_ml_diff_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_mr_G = img_mr_diff_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_dc_G = img_dc_diff_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            im2_uc_G = img2_uc_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_ml_G = img2_ml_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_mr_G = img2_mr_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_dc_G = img2_dc_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            img2_uc_G_unchanged_pred = img1_mc_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_uc_G;
            img2_ml_G_unchanged_pred = img1_mc_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ml_G;
            img2_mr_G_unchanged_pred = img1_mc_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_mr_G;
            img2_dc_G_unchanged_pred = img1_mc_G_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dc_G;
            
            block_G = zeros(box, box);

            cvx_begin quiet
            variables block_G(box, box);
            minimize f1(block_G, img2_uc_G_unchanged_pred, img2_ml_G_unchanged_pred, img2_mr_G_unchanged_pred, img2_dc_G_unchanged_pred, im2_uc_G, im2_ml_G, im2_mr_G, im2_dc_G, 3)
            subject to
                block_G >= 0;
                block_G <= 1;
            cvx_end

            disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in G channel finished']); 
            img2_mc_G_unchanged_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block_G;
        end
        
        % B channel
        if index_B(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) == ones(box, box)
            img2_mc_B_unchanged_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = zeros(box, box);  
        else
            ref_uc_B = img_uc_diff_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_ml_B = img_ml_diff_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_mr_B = img_mr_diff_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            ref_dc_B = img_dc_diff_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            im2_uc_B = img2_uc_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_ml_B = img2_ml_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_mr_B = img2_mr_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            im2_dc_B = img2_dc_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
            
            img2_uc_B_unchanged_pred = img1_mc_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_uc_B;
            img2_ml_B_unchanged_pred = img1_mc_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_ml_B;
            img2_mr_B_unchanged_pred = img1_mc_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_mr_B;
            img2_dc_B_unchanged_pred = img1_mc_B_unchanged(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) + ref_dc_B;
            
            block_B = zeros(box, box);
        
            cvx_begin quiet
            variables block_B(box, box);
            minimize f1(block_B, img2_uc_B_unchanged_pred, img2_ml_B_unchanged_pred, img2_mr_B_unchanged_pred, img2_dc_B_unchanged_pred, im2_uc_B, im2_ml_B, im2_mr_B, im2_dc_B, 3)
            subject to
                block_B >= 0;
                block_B <= 1;
            cvx_end

            disp(['Optimization of block(' num2str(i) ',' num2str(j) ') in B channel finished']); 
            img2_mc_B_unchanged_pred(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = block_B;
        end    
    end
end
toc

time = toc;
%% Model Evaluation
img_pred_R = img2_mc_R_changed_pred + img2_mc_R_unchanged_pred;
img_pred_R = img_pred_R(1:row, 1:col);
img_pred_R = im2uint8(img_pred_R);
img2_mc_R = im2uint8(img2_mc_R);
PSNR_R = psnr(img2_mc_R, img_pred_R);

img_pred_G = img2_mc_G_changed_pred + img2_mc_G_unchanged_pred;
img_pred_G = img_pred_G(1:row, 1:col);
img_pred_G = im2uint8(img_pred_G);
img2_mc_G = im2uint8(img2_mc_G);
PSNR_G = psnr(img2_mc_G, img_pred_G);

img_pred_B = img2_mc_B_changed_pred + img2_mc_B_unchanged_pred;
img_pred_B = img_pred_B(1:row, 1:col);
img_pred_B = im2uint8(img_pred_B);
img2_mc_B = im2uint8(img2_mc_B);
PSNR_B = psnr(img2_mc_B, img_pred_B);

img2_pred(:, :, 1) = img_pred_R;
img2_pred(:, :, 2) = img_pred_G;
img2_pred(:, :, 3) = img_pred_B;
% PSNR = 1 / 3 * (PSNR_R + PSNR_G + PSNR_B); 
PSNR = psnr(img2_mc, img2_pred);

figure(1)
subplot(121)
imshow(img2_mc)
title('Frame 2 center image: X','fontsize', 24)
xlabel(['Overall Running Time: ', num2str(time), 's'], 'fontsize',24)
subplot(122)
imshow(img2_pred)
title('Frame 2 center image: Predicted X','fontsize',24)
xlabel(['PSNR of predicted ' dir ' center image: ' num2str(PSNR)],'fontsize',24)
disp(['PSNR of predicted ' dir ' center image: ' num2str(PSNR)]);