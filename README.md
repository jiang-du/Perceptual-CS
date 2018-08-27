# Perceptual Compressive Sensing

----------
By [Jiang Du](https://github.com/jiang-du), [Xuemei Xie](http://web.xidian.edu.cn/xmxie/), Chenye Wang, [Guangming Shi](http://web.xidian.edu.cn/gmshi/)

To be presented in The First Chinese Conference on Pattern Recognition and Computer Vision (PRCV), Nov. 2018. (This project is under construction. The authors are working hard on revision.)

## Introduction ##

Compressive sensing (CS) works to acquire measurements at sub-Nyquist rate and recover the scene images. Existing CS methods always recover the scene images in pixel level. This causes the smoothness of recovered images and lack of structure information, especially at a low measurement rate. To overcome this drawback, in this paper, we propose perceptual CS to obtain high-level structured recovery. Our task no longer focuses on pixel level. Instead, we work to make a better visual effect. In detail, we employ perceptual loss, defined on feature level, to enhance the structure information of the recovered images. Experiments show that our method achieves better visual results with stronger structure information than existing CS methods at the same measurement rate.

## Platform Setup ##

Ubuntu 16.04 operation system

Caffe (The authors trained perceptual CS on the SSD version of caffe. [Available here](https://github.com/weiliu89/caffe/tree/ssd "caffe for SSD").)

MATLAB R2014b

NVidia GeForce GTX Titan XP GPUs

## Steps ##

1. Install [caffe](https://github.com/BVLC/caffe) on ubuntu system with MATLAB support.
2. Download [DIV2K](https://data.vision.ee.ethz.ch/cvl/DIV2K/) dataset and use the full resolution images.
3. Croping the images to 256*256 size. Then convert the format into h5 files.
4. Download [VGG-19 pre-trained model](http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_19_layers.caffemodel).
5. Before running the code, modify the file locations, for example, caffe dictionary, etc.
6. Training the model, or download the pre-trained models. (will be available in the future)
7. Test the model.

## Related works ##
These are some related work done by the authors' team related to Perceptual Compressive Sensing:

[1] [Fully Convolutional Measurement Network for Compressive Sensing Image Reconstruction](https://arxiv.org/abs/1712.01641), Neurocomputing, 2018. (in press)

[2] [Full Image Recover for Block-Based Compressive Sensing](https://arxiv.org/abs/1802.00179), IEEE International Conference on Multimedia and Expo (ICME), 2018. (in press)

[3] [Adaptive Measurement Network for CS Image Reconstruction](https://link.springer.com/chapter/10.1007/978-981-10-7302-1_34), CCF Chinese Conference on Computer Vision (CCCV), 2017.

[4] Color image compressive sensing network with channel-shared measurement, submitted to IJCAI 2018, rejected.

[5] Color image compressive sensing network based on learned measurement matrix, submitted to BMVC 2018, rejected.

## Applications ##
Perceptual CS is used in the following publication(s):

[6] J. Du, et al. Color Image Reconstruction with Perceptual Compressive Sensing, The 24th International Conference on Pattern Recognition (ICPR), pp. 1512-1517, Aug. 2018. (in press)

Video Demo: [https://youtu.be/W3P2a21hpPY](https://youtu.be/W3P2a21hpPY)

## Citing perceptual CS ##
Please cite our paper in your publications if it helps your research:

    @article{xie2018perceptual,
      title={Perceptual Compressive Sensing},
      author={Du, Jiang and Xie, Xuemei and Shi, Guangming and Wang, Chenye and Xu, Xun},
      journal={arXiv preprint arXiv:1802.00176},
      year={2018}
    }
