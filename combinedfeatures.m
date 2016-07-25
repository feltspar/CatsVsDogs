%{
Authors:
Vishal Manghnani (vjm1952@rit.edu)
Shubham Saxena (ss4017@rit.edu)
Akshai Prabhu (ap40170@rit.edu)
%}
%Reference: IMAGE RECOGNITION FOR CATS AND DOGS. HYO JIN CHUNG AND MINH N. TRAN

function  combined = combinedfeatures( catsimages,dogsimages )
catsize= size(catsimages,3);
dogsize= size(dogsimages,3);
catresolution= size(catsimages,1);
dogresolution = size(dogsimages,1);
cat= zeros(catresolution*catresolution,catsize);
dog= zeros(dogresolution*dogresolution,dogsize);
for i=1:catsize
   features= preprocess(catsimages(:,:,i));
   %fname = sprintf('CatEdges%d.png', i);
   %imwrite(features,fname);
   cat(:,i)= reshape(features,size(features,1)*size(features,1),1);
end
for i=1:dogsize
   features= preprocess(dogsimages(:,:,i));
   %fname = sprintf('DogEdges%d.png', i);
   %imwrite(features,fname);
   dog(:,i)= reshape(features,size(features,1)*size(features,1),1);
end

combined= [cat dog];
figure; imagesc(reshape(mean(combined,2),256,256)); colormap(gray);
[U,S,V]=PCA(combined);

A = S*V';
ca= A(:,1:catsize);
da= A(:,catsize+1:catsize+dogsize);
mc = mean(ca,2);
md = mean(da,2);
SB = (md-mc)*(md-mc)';
 M1 = repmat(mc,[1,catsize]);
 M2 = repmat(md,[1,dogsize]);
 SW1 = (A(:,1:catsize) - M1) * (A(:,1:catsize) - M1)';
 
 SW2 = (A(:,catsize+1:catsize+dogsize) - M2) * (A(:,catsize+1:catsize+dogsize) - M2)';
 

 SW = SW1 + SW2;
 [V2,d] = eig(SB,SW);


[l,ind] = max(abs(diag(d)));
w = V2(:,ind);
w = w/norm(w,2);

cats= w'*U'*cat;
dogs=w'*U'*dog;


[threshold,isneg] = findThreshold(cats,dogs);

save('model.mat','w','U','threshold','isneg');

end

