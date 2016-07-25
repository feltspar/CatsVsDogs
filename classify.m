%{
Authors:
Vishal Manghnani (vjm1952@rit.edu)
Shubham Saxena (ss4017@rit.edu)
Akshai Prabhu (ap40170@rit.edu)
%}
%Reference: IMAGE RECOGNITION FOR CATS AND DOGS. HYO JIN CHUNG AND MINH N. TRAN

function  output  = classify( testimages )

testsize= size(testimages,3);
testresolution= size(testimages,1);
test= zeros(testresolution*testresolution,testsize);


for i=1:testsize
   features= preprocess(testimages(:,:,i));
   test(:,i)= reshape(features,size(features,1)*size(features,1),1);
end

load('model.mat')
Test= w'*U'*test;
if isneg==1
    Test=-Test;
end
output = zeros(1,length(Test));
for i = 1 : length(Test)
if Test(i) > threshold
    output(i) = 1;
end
end

