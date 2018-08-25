clear
close all
clc

% Padding around the input image, default 16
mypad=16;

%% Select measurement rate (MR): 0.25, 0.10, 0.04 or 0.01
mr = '0.04';
mr_str = mr(3:end);

fprintf('Measurement Rate = %s \n', mr)

%% Initializations

% Dataset for testing
test_images_dir = './test_images';
test_images = dir(test_images_dir);
test_images = test_images(3:end);

output_dir = ['./reconstruction_results/mr_0_', mr_str, '/'];

% Initialize Caffe
addpath(genpath('../../../matlab'))
try
    caffe.reset_all();
catch
    caffe.reset_all();
end
caffe.set_mode_gpu();

% Prototxt file for the selected MR
prototxt_file = ['./deploy_prototxt_files/PCS_0_', mr_str, '.prototxt'];

% Caffemodel for the selected MR
caffemodel = '/home/jiangdu/caffe/examples/Perceptual-CS/models/PCS_04_iter_1000000.caffemodel';


%%
tic;  
psnr=zeros(length(test_images),1);
time_complexity=zeros(length(test_images),1);
for image_number = 1:length(test_images)
    
    image_name = test_images(image_number).name;
    input_im_nn = im2double(imread(fullfile(test_images_dir,image_name))); %Input for the ReconNet
    if size(input_im_nn,3) ==3
        input_im_nn = rgb2ycbcr(input_im_nn);
    end
    input_im_nn = input_im_nn (:, :, 1);
    
    [size_x,size_y]=size(input_im_nn);
    modify_prototxt(prototxt_file, 1, 2*mypad+size_y, 2*mypad+size_x);
    t_img = zeros(2*mypad+size_x, 2*mypad+size_y);
    t_img(mypad+1:mypad+size_x,mypad+1:mypad+size_y)=input_im_nn;
    net = caffe.Net(prototxt_file, caffemodel, 'test');
    start_time = tic;
    temp = net.forward({t_img});
    time_complexity(image_number) = toc(start_time);
    temp=temp{1};
    rec_im=temp(mypad+1:mypad+size_x,mypad+1:mypad+size_y);
    
    
    [~,name,~] = fileparts(image_name);
    imwrite(rec_im, [output_dir name '.png']);
    
    
    diff = input_im_nn - rec_im;
    sig = sqrt(mean(input_im_nn(:).^2));
    diff = diff(:);
    rmse = sqrt(mean(diff(:).^2));
    psnr(image_number) = 20*log10(1/rmse);
    
    clear im_comp temp input_deep
    
    fprintf('\n %15s: PSNR = %f dB, Time = %f  seconds\n', image_name, psnr(image_number), time_complexity(image_number))
end
toc;
fprintf( num2str( sum(psnr(:))/11 ))
fprintf(['\n All reconstruction results are saved in ', output_dir, '\n'])