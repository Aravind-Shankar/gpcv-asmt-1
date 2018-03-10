ip = input_script();

figure('Name','Click top-left->bottom-left->bottom-right->top-right. Then ENTER.','NumberTitle','off');
imshow(ip.img);
[x, y] = getpts;        % chose 2rd full square tile in 3rd column
ip.q1_pts_or = [x y];
close;
in = inputdlg({'Enter square side length in pixels'},'Corrected square');   % gave 100
in = str2double(in{:});
ip.q1_pts_tr = [1 1; 1 in; in in; in 1];

A = zeros(8, 9);
for i=1:4
    ia = 2*i;
    
    x_or = ip.q1_pts_or(i,1);
    y_or = ip.q1_pts_or(i,2);
    x_tr = ip.q1_pts_tr(i,1);
    y_tr = ip.q1_pts_tr(i,2);
    
    A(ia-1, :) = [-x_or -y_or -1 0 0 0 x_tr*x_or x_tr*y_or x_tr];
    A(ia, :) = [0 0 0 -x_or -y_or -1 y_tr*x_or y_tr*y_or y_tr];
end

[U,S,V] = svd(A);
h = V(:, size(V,2));
H = reshape(h, [3,3])'; % reshape() does col-major

output_script(ip.img, H);