# Trained models for Perceptual CS #

The trained models of "Perceptual Compressive Sensing" is available on Google Drive:

[https://drive.google.com/drive/folders/1-ULrcUKRCDub-cegzxc5tRne3J_2yL4X?usp=sharing](https://drive.google.com/drive/folders/1-ULrcUKRCDub-cegzxc5tRne3J_2yL4X?usp=sharing)

## File list ##

    PCS_MR_01_VGG_22_iter_1000000.caffemodel
    PCS_MR_01_VGG_34_iter_1000000.caffemodel
    PCS_MR_04_VGG_22_iter_1000000.caffemodel
    PCS_MR_04_VGG_34_iter_1000000.caffemodel

## Note ##

- 4 trained models. The layers of VGG19 are 2_2 and 3_4. The measurement rates (MR) are 1% and 4%. 

- When using different MR, please choose the corresponding deploy prototxt files in "Perceptual-CS/test/deploy\_prototxt\_files".