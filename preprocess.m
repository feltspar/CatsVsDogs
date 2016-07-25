%{
Authors:
Vishal Manghnani (vjm1952@rit.edu)
Shubham Saxena (ss4017@rit.edu)
Akshai Prabhu (ap40170@rit.edu)
%}
function opimg = preprocess( input_img )

input_img= adapthisteq(input_img);

gauss= fspecial('gaussian',3,3);
filteredimg= rangefilt(imfilter(input_img,gauss));
 
opimg= filteredimg

end
