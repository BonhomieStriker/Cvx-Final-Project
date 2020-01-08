function index = img_seg(img, box, threshold, num)
%img: image with 1 channel
%box: box size (same with the main project)
%bias: determine whether the element in specific position of the input image is set to 1
%tips: usually set to 0.05 - 0.15 (or whatever between (0,1))
%num: determine whether the elements in specific block are set to all 1s
%tips: usually set to box/2
img = im2double(img);
index = zeros(size(img));
[row, col] = size(img);
%Generate the binarized image index
index(find(img >= threshold)) = 1;

rowb = ceil(row/box);
colb = ceil(col/box);

for j = 1:colb
    for i = 1:rowb
        block = index(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j);
        if sum(sum(block)) >= num
            index(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = ones(size(block));
        else
            index(box * (i - 1) + 1:box * i, box * (j - 1) + 1:box * j) = zeros(size(block));
        end
    end
end

