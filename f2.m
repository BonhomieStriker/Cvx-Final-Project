function y = f2(img, ref1, ref2, ref3, ref4, flag)
a1 = 1;
a2 = 1;
a3 = 1;
a4 = 1;

if flag == 0
    y = a1 * norm(img - ref1, inf) + a2 * norm(img - ref2, inf) + a3 * norm(img - ref3, inf) + a4 * norm(img - ref4, inf);
elseif flag == 1
    y = a1 * norm(img - ref1, 1) + a2 * norm(img - ref2, 1) + a3 * norm(img - ref3, 1) + a4 * norm(img - ref4, 1);
elseif flag == 2
    y = a1 * norm(img - ref1) + a2 * norm(img - ref2) + a3 * norm(img - ref3) + a4 * norm(img - ref4);
elseif flag == 3
    y = a1 * norm(img - ref1, 'fro') + a2 * norm(img - ref2, 'fro') + a3 * norm(img - ref3, 'fro') + a4 * norm(img - ref4, 'fro');
end