ip = input_script();

figure('Name','8 pts for 2 pairs of parallel lines. Then ENTER.','NumberTitle','off');
imshow(ip.img);
[x, y] = getpts;
ip.q2_para_line_pts = [x y ones(numel(x),1)];
close;

l1 = cross(ip.q2_para_line_pts(1,:), ip.q2_para_line_pts(2,:));
l2 = cross(ip.q2_para_line_pts(3,:), ip.q2_para_line_pts(4,:));
l3 = cross(ip.q2_para_line_pts(5,:), ip.q2_para_line_pts(6,:));
l4 = cross(ip.q2_para_line_pts(7,:), ip.q2_para_line_pts(8,:));
linf = normc(cross(cross(l1,l2), cross(l3,l4))');

H = [1 0 0; 0 1 0; linf'];

im_out = output_script(ip.img, H);

figure('Name','8 pts for 2 pairs of normal lines. Then ENTER.','NumberTitle','off');
imshow(im_out);
[x, y] = getpts;
ip.q2_perp_line_pts = [x y ones(numel(x),1)];
close; 

l1 = cross(ip.q2_perp_line_pts(1,:), ip.q2_perp_line_pts(2,:));
l2 = cross(ip.q2_perp_line_pts(3,:), ip.q2_perp_line_pts(4,:));
l3 = cross(ip.q2_perp_line_pts(5,:), ip.q2_perp_line_pts(6,:));
l4 = cross(ip.q2_perp_line_pts(7,:), ip.q2_perp_line_pts(8,:));

A = [l1(1)*l2(1) (l1(2)*l2(1)+l1(1)*l2(2)) (l1(2)*l2(2));...
    l3(1)*l4(1) (l3(2)*l4(1)+l3(1)*l4(2)) (l3(2)*l4(2))];
c = null(A);
C = [c(1) c(2); c(2) c(3)];
K = mod_chol(C);

H = inv([K [0; 0]; 0 0 1]);

im_out2 = output_script(im_out, H);