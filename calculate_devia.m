function y = calculate_devia(img1, img2, orientation)
%img1是参考图，img2是移动过的图
%1表示左，2表示右，3表示上，4表示下
    [m, n] = size(img1);
    m0 = fix(m/3);  n0 = fix(n/3);
    y = 0;
    %向左移动
    if orientation == 1  
        mark = sum(sum(abs(img2(:, 1:n0))));
        for i = 1:n0
            diff = img1(:, 1:n0) - img2(:, i:i + n0 - 1);
            num = sum(sum(abs(diff)));
            if mark > num
               y = i - 1;
               mark = num;
            end
        end
    %向右移动
    elseif orientation == 2
        mark = sum(sum(abs(img2(:, n - n0 + 1:n))));
        for i = 1:n0
           diff = img1(:, n - n0 + 1:n) - img2(:, n - n0 + 2 - i:n + 1 - i);
           num = sum(sum(abs(diff)));
           if mark > num
              y = i - 1;
              mark = num;
           end
        end
    %向上移动
    elseif orientation == 3
        mark = sum(sum(abs(img2(1:m0, :))));
        for i = 1:m0
           diff = img1(1:m0, :) - img2(i:i + m0 - 1, :);
           num = sum(sum(abs(diff)));
           if mark > num
              y = i - 1;
              mark = num;
           end
        end
    %向下移动
    elseif orientation == 4
        mark = sum(sum(abs(img2(m - m0 + 1:m, :))));
        for i = 1:m0
           diff = img1(m - m0 + 1:m, :) - img2(m - m0 + 2 - i:m + 1 - i, :);
           num = sum(sum(abs(diff)));
           if mark > num
              y = i - 1;
              mark = num;
           end
        end
    end
end