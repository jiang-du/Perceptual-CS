%% copyrighted Jiang Du, 2018, all rights reserved
% This work is to convert color vgg19-net to jiangdu-grayscale net
% for perceptual loss in compressive sensing
addpath('/home/jiangdu/caffe/matlab');
% call caffe.reset_all() to reset caffe
caffe.reset_all();
caffe.set_mode_gpu();
gpu_id = 0;  % we will use the first gpu in this demo
caffe.set_device(gpu_id);


model_dir = '';
net_model = [model_dir 'VGG_ILSVRC_19_layers_deploy.prototxt'];
net_weights = [model_dir 'VGG_ILSVRC_19_layers.caffemodel'];
phase = 'test'; % run with phase test (so that dropout isn't applied)

%% Initialize a network
vgg = caffe.Net(net_model, net_weights, phase);
% keyboard;

% DIY net by Jiang Du
dj = caffe.Net('jiangdu.prototxt', phase);


%% Process the weights
% read the weights of vgg
w11=vgg.params('conv1_1',1).get_data();
% combine the 3 colors with sum
d11=w11(:,:,1,:)+w11(:,:,2,:)+w11(:,:,3,:);
% calculate the average
d11=d11./3;
% read the beis of vgg
b11=vgg.params('conv1_1',2).get_data();
% % combine the 3 colors with sum
% j11=b11(:,:,1,:)+b11(:,:,2,:)+b11(:,:,3,:);
% % calculate the average
% j11=j11./3;


%% Copy the weights
% modify
% conv1_1
dj.params('conv1_1',1).set_data(d11);
dj.params('conv1_1',2).set_data(b11);
% copy
layer_names=['conv1_2';'conv2_1';'conv2_2';'conv3_1';'conv3_2';'conv3_3';'conv3_4';'conv4_1';'conv4_2';'conv4_3';'conv4_4';'conv5_1';'conv5_2';'conv5_3';'conv5_4'];
layer_names=layer_names';
for i=layer_names
    dj.params(i,1).set_data(vgg.params(i,1).get_data());
    dj.params(i,2).set_data(vgg.params(i,2).get_data());
end
layer_names=['fc6';'fc7';'fc8'];
layer_names=layer_names';
for i=layer_names
    dj.params(i,1).set_data(vgg.params(i,1).get_data());
    dj.params(i,2).set_data(vgg.params(i,2).get_data());
end

% dj.save('jiangdu.caffemodel');

%% cerate sub-nets
sub_net=caffe.Net('Perceptual_output.prototxt', phase);
sub_names=['conv1_1';'conv1_2';'conv2_1';'conv2_2';'conv3_1';'conv3_2';'conv3_3';'conv3_4';'conv4_1';'conv4_2';'conv4_3';'conv4_4';'conv5_1';'conv5_2';'conv5_3';'conv5_4'];
sub_names=sub_names';
for i=sub_names
    sub_net.params([i','a'],1).set_data(dj.params(i',1).get_data());
    sub_net.params([i','a'],2).set_data(dj.params(i',2).get_data());
end
sub_net.save('Perceptual_output.caffemodel');


sub_net=caffe.Net('Perceptual_label.prototxt', phase);
sub_names=['conv1_1';'conv1_2';'conv2_1';'conv2_2';'conv3_1';'conv3_2';'conv3_3';'conv3_4';'conv4_1';'conv4_2';'conv4_3';'conv4_4';'conv5_1';'conv5_2';'conv5_3';'conv5_4'];
sub_names=sub_names';
for i=sub_names
    sub_net.params([i','b'],1).set_data(dj.params(i',1).get_data());
    sub_net.params([i','b'],2).set_data(dj.params(i',2).get_data());
end
sub_net.save('Perceptual_label.caffemodel');


% keyboard;

%% visualization
% img=zeros(32,'single');
% for i=1:8
%     for j=1:8
%         img(i*4-2:i*4,j*4-2:j*4)=d11(:,:,:,i*8-8+j);
%     end
% end
% imshow(img,[]);