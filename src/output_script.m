function [ output ] = output_script(img, H)
    output = imwarp(img, projective2d(H'));
%     figure;
%     subplot(1,2,1);
%     imshow(img);
%     subplot(1,2,2);
    imshow(output);
    getpts;
    close;
end