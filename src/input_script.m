function [ ip ] = input_script()

%COMMON:
% ip.scale : input image reading scale
% ip.img : read (scaled) image

%Q1:
% ip.q1_pts_or : [x1 y1; x2 y2; ...]. 4 pts in given image
% ip.q1_pts_tr : [x1' y1'; x2' y2'; ...]. 4 pts in corrected image

%Q2:
% ip.q2_para_line_pts : [x1 y1; x2 y2; ...]. 8 pts in given image, forming 2 sets of parallel lines
% ip.q2_perp_line_pts : [x1 y1; x2 y2; ...]. 8 pts in given image, forming 2 sets of normal lines

%Q3:
% ip.q3_perp_line_pts : [x1 y1; x2 y2; ...]. 16/20 pts in given image, forming 4/5 sets of normal lines

%Q4:
% ip.q4_circle_pts : [x1 y1; x2 y2; ...]. 5 pts in given image, forming an ellipse
% ip.q4_para_line_pts : [x1 y1; x2 y2; ...]. 8 pts in given image, forming 2 sets of parallel lines


%%%% CODE BEGINS NOW for each input file. %%%%


%     IMG_FILE = '../given-images/Image1.JPG';
%     ip.scale = 0.1;
%     %Q1
%     [x, y] = getpts;        % chose 2rd full square tile in 3rd column
%     in = inputdlg({'Enter square side length in pixels'},'Corrected square');   % gave 100

%     IMG_FILE = '../given-images/Image2.JPG';
%     ip.scale = 0.1;
%     %Q1
%     [x, y] = getpts;        % chose square just above the light-board to the right
%     in = inputdlg({'Enter square side length in pixels'},'Corrected square');   % gave 120

%     IMG_FILE = '../given-images/Image3.JPG';
%     ip.scale = 0.1;
%     %Q1
%     [x, y] = getpts;        % chose 3rd full square in 4th row
%     in = inputdlg({'Enter square side length in pixels'},'Corrected square');   % gave 120

%     IMG_FILE = '../given-images/Image4.JPG';
%     ip.scale = 0.1;
%     %Q1
%     [x, y] = getpts;        % chose bounds of 5Clubs
%     in = inputdlg({'Enter square side length in pixels'},'Corrected square');   % gave 200

    IMG_FILE = '../given-images/Image5.JPG';
    ip.scale = 0.1;
%     %Q1
%     [x, y] = getpts;        % chose monitor
%     in = inputdlg({'Enter square side length in pixels'},'Corrected square');   % gave 300

%     IMG_FILE = '../given-images/image6.png';
%     ip.scale = 1;
%     %Q1
%     [x, y] = getpts;        % chose left-top window
%     in = inputdlg({'Enter square side length in pixels'},'Corrected square');   % gave 120

    ip.img = read_image(IMG_FILE, ip.scale);
end