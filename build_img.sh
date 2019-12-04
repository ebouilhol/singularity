#!/bin/bash

# Make sure the requisite NVIDIA
# installers are in this directory,
# and set the variables below.
# Then 
#
# chmod u+x build_image.sh
# sudo ./build_image.sh
#
# to build a Singularity image with
# tensorflow, keras, and sklearn installed.

######################################
# Set versions of things to install
######################################

# NVIDIA driver version
NVIDIA_VERSION="418.67"
NVIDIA_MAJOR_VERSION="418"

# CUDA version
CUDA_VERSION="10.1.243_418.87.00"

# CUDNN version
CUDNN_VERSION="10.1-linux-x64-v7.6.3.30"

# TensorFlow version
TENSORFLOW_VERSION=">=1.13.0"

######################################
# Set some other options
######################################

# Name of image recipe file:
DEFFILE_NAME="tf_keras.def"

# Name of singularity image:
IMAGE_NAME="tf_keras.simg"

# Will this image be writable?
WRITABLE=""
#WRITABLE="--writable"

######################################
# Fill the template
######################################

sed "s/__NVIDIA_VERSION__/$NVIDIA_VERSION/g" recipe > $DEFFILE_NAME 
sed -i "s/__CUDA_VERSION__/$CUDA_VERSION/g" $DEFFILE_NAME
sed -i "s/__CUDNN_VERSION__/$CUDNN_VERSION/g" $DEFFILE_NAME
sed -i "s/__NVIDIA_MV__/$NVIDIA_MAJOR_VERSION/g" $DEFFILE_NAME
sed -i "s/__TENSORFLOW_VERSION__/$TENSORFLOW_VERSION/g" $DEFFILE_NAME


######################################
# Build the image
######################################

singularity build $WRITABLE $IMAGE_NAME $DEFFILE_NAME 

