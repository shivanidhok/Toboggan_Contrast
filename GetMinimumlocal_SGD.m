function [local_p_x,local_p_y] = GetMinimumlocal_SGD(I,n,ii,jj)
% The function returns the local minima around n
% Author: Shivani Dhok
% Date: February 7, 2020
[row col] = size(I)
I_after_pad = [9999.*ones(row,1) I 9999.*ones(row,1)];
I_after_pad = [9999.*ones(1,col+2); I_after_pad; 9999.*ones(1,col+2)];

mm = ii+1;
nn = jj+1;

I_local_min = min(I_after_pad(mm-1:mm+1,nn-1:nn+1));
for kk = mm-1:mm+1
    for ll = nn-1:nn+1
        if I_after_pad(kk,ll) == I_local_min
            local_p_x = kk-1;
            local_p_y = ll-1;
        end
    end
end
