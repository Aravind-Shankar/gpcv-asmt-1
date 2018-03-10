function [ im ] = read_image( fname, scale )
%READ_IMAGE Summary of this function goes here
%   Detailed explanation goes here
im = imresize(imread(fname), scale);
end

