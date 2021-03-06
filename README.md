# Perceptual Compressive Sensing

----------
By [Jiang Du](https://github.com/jiang-du), [Xuemei Xie](http://web.xidian.edu.cn/xmxie/), Chenye Wang, [Guangming Shi](http://web.xidian.edu.cn/gmshi/)

This paper was presented in The First Chinese Conference on Pattern Recognition and Computer Vision (PRCV), November 23-26, 2018. (oral presentation).
Published paper available [here](https://link.springer.com/chapter/10.1007/978-3-030-03338-5_23 "Perceptual Compressive Sensing").

## Introduction ##

Compressive sensing (CS) works to acquire measurements at sub-Nyquist rate and recover the scene images. Existing CS methods always recover the scene images in pixel level. This causes the smoothness of recovered images and lack of structure information, especially at a low measurement rate. To overcome this drawback, in this paper, we propose perceptual CS to obtain high-level structured recovery. Our task no longer focuses on pixel level. Instead, we work to make a better visual effect. In detail, we employ perceptual loss, defined on feature level, to enhance the structure information of the recovered images. Experiments show that our method achieves better visual results with stronger structure information than existing CS methods at the same measurement rate.

## Framework ##

The architecture consists of two parts: compressive sensing network and perceptual loss network.

![](https://github.com/jiang-du/Perceptual-CS/raw/master/img/Framework.png)

## Experimental Results ##

Measurement Rate: 4%

![](https://github.com/jiang-du/Perceptual-CS/raw/master/img/MR-4.png)

(1) Block effect also occurs in Fig 4 (c) in DR2-Net.

DR2-Net achieves highest PSNR among random Gaussian methods, since it adds several Res-blocks that fully convergence in the reconstruction stage.

(2) The method with adaptive measurement for Fig 4 (d) adopts one Res-block, achieving the highest PSNR. The comparison among several typical methods including DR2-Net is in Fig 4, where FCMN [1] with full image gets the best result in terms of PSNR.

It should be pointed out that only one Res-block is used in both FCMN [1] and the proposed framework in this paper. One can add more Res-blocks for further improvement.

(3) With just one Res-block, perceptual loss in Fig 4 (e) and (f) works well, which improves FCMN [1]. Structure information is kept. In some case, even wake structure can become strong (see Fig 4 (f) compared to Fig 4 (a) and (d)).

It should be noted that, even if PSNR is worse with perceptual loss, the structure information is clearly reconstructed.

## Platform Setup ##

Hardawre:

- NVidia GeForce GTX Titan XP GPUs * 4 (with CUDA and Cudnn)

Software:

- Ubuntu 16.04

- Caffe (The authors trained perceptual CS on the SSD version of caffe. [Available here](https://github.com/weiliu89/caffe/tree/ssd "caffe for SSD").)

- MATLAB R2014b

## Steps ##

1. Install [caffe](https://github.com/BVLC/caffe) on ubuntu system with MATLAB support.
2. Download [DIV2K](https://data.vision.ee.ethz.ch/cvl/DIV2K/) dataset and use the full resolution images.
3. Crop the images to 256*256 size. Then convert the format into h5 files.
4. Download [VGG-19 pre-trained model](http://www.robots.ox.ac.uk/~vgg/software/very_deep/caffe/VGG_ILSVRC_19_layers.caffemodel).
5. Before running the code, modify the file locations, for example, caffe dictionary, etc.
6. Training the model, or download the pre-trained models. (The trained models of FCMN [[1]](https://doi.org/10.1016/j.neucom.2018.04.084) is availbale in "trained_models" and models of this paper is available at Google Drive. [Click here to get the models](https://github.com/jiang-du/Perceptual-CS/blob/master/trained_models/Get_PCS_models.md).) Carefully choose the right deploy prototxt file according to the measurement rate.
7. Test the model. Running "test/test.m" with MATLAB, modifying the test image file name according to the images tested.

## Related works ##
Some work related to Perceptual Compressive Sensing in the authors' lab:

[1] J. Du, X. Xie, C. Wang, *et al.* [Fully Convolutional Measurement Network for Compressive Sensing Image Reconstruction](https://doi.org/10.1016/j.neucom.2018.04.084), Neurocomputing, 328, pp.105-112, 2019.

[2] X. Xie, C. Wang, J. Du, G. Shi. [Full Image Recover for Block-Based Compressive Sensing](https://doi.org/10.1109/ICME.2018.8486521), IEEE International Conference on Multimedia and Expo (ICME), 2018.

[3] X. Xie, Y. Wang, G. Shi, *et al.* [Adaptive Measurement Network for CS Image Reconstruction](https://doi.org/10.1007/978-981-10-7302-1_34), CCF Chinese Conference on Computer Vision (CCCV), 2017.

[4] J. Du, X. Xie, C. Wang, G. Shi. [Color Image Reconstruction with Perceptual Compressive Sensing](https://doi.org/10.1109/ICPR.2018.8546222), The 24th International Conference on Pattern Recognition (ICPR), pp. 1512-1517, Aug. 2018.
Video Demo: [https://youtu.be/W3P2a21hpPY](https://youtu.be/W3P2a21hpPY)

[5] Z. Zhao, X. Xie, C. Wang, *et al.* [Visualizing and understanding of learned compressive sensing with residual network](https://doi.org/10.1016/j.neucom.2019.05.043), Neurocomputing, 359, pp.185-198, 2019.

## Citing perceptual CS ##
Please cite our paper in your publications if it helps your research:

    @InProceedings{du2018perceptual,
    author = {Du, Jiang and Xie, Xuemei and Wang, Chenye and Shi, Guangming},
    title = {Perceptual Compressive Sensing},
    booktitle = {Pattern Recognition and Computer Vision},
    year = {2018},
    month = {November},
    doi = {10.1007/978-3-030-03338-5_23}, 
	pages = {268--279},
	isbn = {978-3-030-03338-5},
	publisher = {Springer International Publishing}
    }
