mkdir /home/jiangdu/caffe/examples/Perceptual-CS/train/snapshot
#Create a folder to save the caffe models (measurement rate is 0.04)
/home/jiangdu/caffe/build/tools/caffe train --solver /home/jiangdu/caffe/examples/Perceptual-CS/train/Solver.prototxt --gpu 0 --weights /home/jiangdu/caffe/examples/Perceptual-CS/perceptual_loss_caffe/Perceptual_output.caffemodel,/home/jiangdu/caffe/examples/Perceptual-CS/perceptual_loss_caffe/Perceptual_label.caffemodel
