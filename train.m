%{
Authors:
Vishal Manghnani (vjm1952@rit.edu)
Shubham Saxena (ss4017@rit.edu)
Akshai Prabhu (ap40170@rit.edu)
%}
clc;
clear all;
close all;
example_dir='images/cats';
file_list = dir( [example_dir filesep() '*.jpg'] );
fprintf('%d',length(file_list));
catsimages=zeros(256,256,length(file_list));
for index_variable = 1 : length(file_list)
 file_name = file_list( index_variable ).name;
 if(strcmp(file_name,'..')||strcmp(file_name,'.')||strcmp(file_name,'.DS_Store') )continue; end;
 fprintf( 'File %2d is %-36s --> ', index_variable, file_name );
 full_filename = [ example_dir filesep() file_name ];
 fprintf( '%s\n', full_filename );
 img= rgb2gray(im2double(imresize(imread(full_filename),[256 256])));
 catsimages(:,:,index_variable)=img;
 
 
end

example_dir='images/dogs';

file_list = dir( [example_dir filesep() '*.jpg'] );

fprintf('%d',length(file_list));
dogsimages=zeros(256,256,length(file_list));
for index_variable = 1 : length(file_list)
 file_name = file_list( index_variable ).name;
 if(strcmp(file_name,'..')||strcmp(file_name,'.')||strcmp(file_name,'.DS_Store') )continue; end;
 fprintf( 'File %2d is %-36s --> ', index_variable, file_name );
 full_filename = [ example_dir filesep() file_name ];
 fprintf( '%s\n', full_filename );
 img= rgb2gray(im2double(imresize(imread(full_filename),[256 256])));
 dogsimages(:,:,index_variable)=img;
 
 
end

combinedfeatures(catsimages,dogsimages);
disp('Trained successfully');


