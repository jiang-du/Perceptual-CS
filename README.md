# Perceptual Compressive Sensing

----------
By [Jiang Du](https://github.com/jiang-du), [Xuemei Xie](http://web.xidian.edu.cn/xmxie/), Chenye Wang, [Guangming Shi](http://web.xidian.edu.cn/gmshi/)

## Introduction ##

Compressive sensing (CS) works to acquire measurements at sub-Nyquist rate and recover the scene images. Existing CS methods always recover the scene images in pixel level. This causes the smoothness of recovered images and lack of structure information, especially at a low measurement rate. To overcome this drawback, in this paper, we propose perceptual CS to obtain high-level structured recovery. Our task no longer focuses on pixel level. Instead, we work to make a better visual effect. In detail, we employ perceptual loss, defined on feature level, to enhance the structure information of the recovered images. Experiments show that our method achieves better visual results with stronger structure information than existing CS methods at the same measurement rate.

## Platform Setup ##

Ubuntu 16.04 operation system

Caffe (The authors trained perceptual CS on the SSD version of caffe. [Available here](https://github.com/weiliu89/caffe/tree/ssd "caffe for SSD").)

MATLAB R2014b

NVidia GeForce GTX Titan XP GPUs

## Citing perceptual CS ##
Please cite our paper in your publications if it helps your research:

    @article{xie2018perceptual,
      title={Perceptual Compressive Sensing},
      author={Du, Jiang and Xie, Xuemei and Shi, Guangming and Wang, Chenye and Xu, Xun},
      journal={arXiv preprint arXiv:1802.00176},
      year={2018}
    }
