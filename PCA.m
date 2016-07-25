%{
Authors:
Vishal Manghnani (vjm1952@rit.edu)
Shubham Saxena (ss4017@rit.edu)
Akshai Prabhu (ap40170@rit.edu)
%}
%Reference: IMAGE RECOGNITION FOR CATS AND DOGS. HYO JIN CHUNG AND MINH N. TRAN


function [ U,S,V ] = PCA( featurevector )

X= featurevector- repmat(mean(featurevector,2),1,size(featurevector,2));
[U,S,V]= svd(X,0);

figure; imagesc(reshape(U(:,1),256,256)); colormap(gray);
figure; imagesc(reshape(U(:,2),256,256)); colormap(gray);
figure; imagesc(reshape(U(:,3),256,256)); colormap(gray);
figure; imagesc(reshape(U(:,4),256,256)); colormap(gray);

eigValues= diag(S);

energy= zeros(1,length(eigValues));
for i= 1:length(eigValues)
    energy(i)= sum(eigValues(1:i).^2);
end
vectorenergy= energy./energy(end);
disp(energy(end))
d= min(find(vectorenergy>=0.95));
disp(num2str(d));
Ud = U(:,1:d);
Sd= S(1:d,1:d);
Vd= V(:,1:d);

U= Ud;
S= Sd;
V= Vd;

end

