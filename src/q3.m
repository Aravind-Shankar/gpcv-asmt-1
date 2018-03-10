ip = input_script();

figure('Name','20 pts for 5 pairs of normal lines. Then ENTER.','NumberTitle','off');
imshow(ip.img);
[x, y] = getpts;        % chose 
ip.q3_perp_line_pts = [x y ones(numel(x),1)];
close; 

A = zeros(5, 6);
for i=1:5
    k = 4*i;
    
    l = cross(ip.q3_perp_line_pts(k-3,:), ip.q3_perp_line_pts(k-2,:));
    m = cross(ip.q3_perp_line_pts(k-1,:), ip.q3_perp_line_pts(k,:));
    
    A(i, :) = [l(1)*m(1) (l(1)*m(2)+l(2)*m(1)) (l(1)*m(3)+l(3)*m(1)) l(2)*m(2) (l(3)*m(2)+l(2)*m(3)) l(3)*m(3)];
end

c = null(A);
C = [c(1) c(2) c(3); c(2) c(4) c(5); c(3) c(5) c(6)];
H = mat_from_dconic(C);

output_script(ip.img, inv(H));