function y = f0(img, ref1, ref2, ref3, ref4, ref5, ref6, ref7, ref8, flag)
a1 = 1;
a2 = 1;
a3 = 1;
a4 = 1;
a5 = 1;
a6 = 1;
a7 = 1;
a8 = 1;

if flag == 0
    y = a1 * norm(img - ref1, inf) + a2 * norm(img - ref2, inf) + a3 * norm(img - ref3, inf) + a4 * norm(img - ref4, inf)+...
        a5 * norm(img - ref5, inf) + a6 * norm(img - ref6, inf) + a7 * norm(img - ref7, inf) + a8 * norm(img - ref8, inf);
elseif flag == 1
    y = a1 * norm(img - ref1, 1) + a2 * norm(img - ref2, 1) + a3 * norm(img - ref3, 1) + a4 * norm(img - ref4, 1)+...
        a5 * norm(img - ref5, 1) + a6 * norm(img - ref6, 1) + a7 * norm(img - ref7, 1) + a8 * norm(img - ref8, 1);
elseif flag == 2
    y = a1 * norm(img - ref1) + a2 * norm(img - ref2) + a3 * norm(img - ref3) + a4 * norm(img - ref4)+...
        a5 * norm(img - ref5) + a6 * norm(img - ref6) + a7 * norm(img - ref7) + a8 * norm(img - ref8);
elseif flag == 3
    y = a1 * norm(img - ref1, 'fro') + a2 * norm(img - ref2, 'fro') + a3 * norm(img - ref3, 'fro') + a4 * norm(img - ref4, 'fro')+...
        a5 * norm(img - ref5, 'fro') + a6 * norm(img - ref6, 'fro') + a7 * norm(img - ref7, 'fro') + a8 * norm(img - ref8, 'fro');
end