%{
Authors:
Vishal Manghnani (vjm1952@rit.edu)
Shubham Saxena (ss4017@rit.edu)
Akshai Prabhu (ap40170@rit.edu)
%}
%Reference: IMAGE RECOGNITION FOR CATS AND DOGS. HYO JIN CHUNG AND MINH N. TRAN


function [ threshold,isneg] = findThreshold(cats,dogs )
isneg=0;
if mean(dogs)>mean(cats)
    isneg=1;
    dogs= -dogs;
    cats= -cats;
end

dogsorted = sort(dogs);
catsorted = sort(cats);


d = length(dogsorted);
c = 1;


while dogsorted(d) > catsorted(c)
d = d- 1; c  = c + 1;
end


threshold = (dogsorted(d)+catsorted(c))/2;

end

