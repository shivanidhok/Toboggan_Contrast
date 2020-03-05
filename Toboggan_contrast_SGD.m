clc;clear;close all;
% Shivani Dhok
% Date: February 7, 2020
% Digital Image Processing
% Program for: Toboggan Contrast enhancement.

% Gradient
I_grad = [12 14 23 13;
    16 11 21 18;
    21 24 23 12;
    12 21 20 10];

% Image
I = [4 4 3 2;
    3 7 6 1;
    2 7 6 2;
    0 1 0 2];

[row col] = size(I);
I_after_pad = [9999.*ones(row,1) I_grad 9999.*ones(row,1)];
I_after_pad = [9999.*ones(1,col+2); I_after_pad; 9999.*ones(1,col+2)];
I_contrasted = zeros(row,col);
% Get contrasted image
for ii = 1:row
    for jj = 1:col
        n = I_grad(ii,jj);
              
        mm = ii+1;
        nn = jj+1;
        I_local = I_after_pad(mm-1:mm+1,nn-1:nn+1);
        I_local_min = min(I_local(:));
        for kk = mm-1:mm+1
            for ll = nn-1:nn+1
                if I_after_pad(kk,ll) == I_local_min
                    local_p_x = kk-1;
                    local_p_y = ll-1;
                end
            end
        end
        I_contrasted(ii,jj) = I(local_p_x,local_p_y);
    end
end

