%{
Authors:
Vishal Manghnani (vjm1952@rit.edu)
Shubham Saxena (ss4017@rit.edu)
Akshai Prabhu (ap40170@rit.edu)
%}

example_dir='images/test';

file_list = dir( [example_dir filesep() '*.jpg'] );
fprintf('%d',length(file_list));
imagenames={};
testimages=zeros(256,256,length(file_list));
actualoutput=zeros(1,length(file_list));
for index_variable = 1 : length(file_list)
 file_name = file_list( index_variable ).name;
 if(strcmp(file_name,'..')||strcmp(file_name,'.')||strcmp(file_name,'.DS_Store') ) continue; end;
 fprintf( 'File %2d is %-36s --> ', index_variable, file_name );
 full_filename = [ example_dir filesep() file_name ];
 fprintf( '%s\n', full_filename );
 img= rgb2gray(im2double(imresize(imread(full_filename),[256 256])));

 testimages(:,:,index_variable)=img;
 imagenames = [imagenames; {file_name} ];
 if strfind(file_name,'cat') | strfind(file_name,'Cat')
    actualoutput(index_variable)=1;
 end
end
for i =1:length(actualoutput)
    disp(strcat('output for',imagenames(i),' is ',num2str(actualoutput(i))));
end
output=classify(testimages);

prediction=[];
disp(output);
for i=1:length(output)
    if output(i) == 1
        prediction= [prediction;{'Cat'}];
    else
        prediction= [prediction;{'Dog'}];
    end;        
end;
[C,order]= confusionmat(output,actualoutput);
for i= 1: length(imagenames)
    fprintf('The prediction for %s is %s \n',imagenames{i},prediction{i})
    
end;
disp('Confusion Matrix');
disp(C);



