ip = input_script();

figure('Name','5 pts for one ellipse. Then ENTER.','NumberTitle','off');
imshow(ip.img);
[x, y] = getpts;        % chose 
ip.q4_circle_pts = [x y ones(numel(x),1)];
close;
figure('Name','8 pts for 2 pairs of parallel lines. Then ENTER.','NumberTitle','off');
imshow(ip.img);
[x, y] = getpts;        % chose 
ip.q4_para_line_pts = [x y ones(numel(x),1)];
close;

l1 = cross(ip.q4_para_line_pts(1,:), ip.q4_para_line_pts(2,:));
l2 = cross(ip.q4_para_line_pts(3,:), ip.q4_para_line_pts(4,:));
l3 = cross(ip.q4_para_line_pts(5,:), ip.q4_para_line_pts(6,:));
l4 = cross(ip.q4_para_line_pts(7,:), ip.q4_para_line_pts(8,:));
linf = normc(cross(cross(l1,l2), cross(l3,l4))');

A = zeros(5,6);
for i=1:5
    xc = ip.q4_circle_pts(i, :);
    A(i, :) = [xc(1)*xc(1) (2*xc(1)*xc(2)) (2*xc(1)*xc(3)) xc(2)*xc(2) (2*xc(3)*xc(2)) xc(3)*xc(3)];
end

c = null(A);
% C = [c(1) c(2) c(3); c(2) c(4) c(5); c(3) c(5) c(6)];
% 
% IJ = sym('IJ', [3, 1]);
% sol = solve(IJ' * C * IJ == 0, linf' * IJ == 0, IJ' * IJ == 1);

coA = c(1)*(linf(3)^2) + c(6)*(linf(1)^2) - 2*c(3)*linf(1)*linf(3);
coB = 2*c(2)*(linf(3)^2) - 2*c(3)*linf(2)*linf(3) - 2*c(5)*linf(1)*linf(3) + 2*c(6)*linf(1)*linf(2);
coC = c(4)*(linf(3)^2) + c(6)*(linf(2)^2) - 2*c(5)*linf(2)*linf(3);

sd = sqrt(coB^2 - 4*coA*coC);
r1 = (-coB + sd) / (2*coA);
r2 = (-coB - sd) / (2*coA);

I = [r1; 1; -(linf(1)*r1 + linf(2))];
J = [r2; 1; -(linf(1)*r2 + linf(2))];
C = I*J' + J*I';
H = mat_from_dconic(C);
% 
% B = [1i*I(1) 1i*I(2) (-I(2)); (-1i*J(1)) (-1i*J(2)) (-J(2))];
% b = null(B);
% 
% EPSILON = 1e-8;
% if (abs(b(1)) < EPSILON)
%     if (abs(b(2)) < EPSILON)
%         b = b ./ b(3);
%     else
%         b = b ./ b(2);
%     end
% else
%     b = b ./ b(1);
% end
% 
% K = [real(b(1)) real(b(2)); 0 real(b(3))];
% if (det(K) < 0)
%     K(1,1) = -K(1,1);
% end
% H = [ K [0; 0]; linf'];

output_script(ip.img, inv(H));