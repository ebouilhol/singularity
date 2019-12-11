# singularity
Singularity set up for Deep Learning

ON BARACUDA :

Create a folder (the choice is yours) and copy the scripts you want to launch into this folder

In this folder copy from /mnt/cbib/baracuda/singularity_img/tensorflow:

- tf_keras.simg
- tf_keras.def

Create a singularity Instance :
singularity instance start --nv tf_keras.simg instance_name

Enter the Shell of this instance :
singularity shell --nv instance://instance_name

Create a conda environment :
``` shell
conda create -n env_name python=3.6
conda activate env_name (or conda source env_name)
conda install keras
conda install tensorflow-pgu
Install any other libs you need then run your scripts python myscript.py
```

To get off the instance shell just type "exit"

To run a script without using the instance shell :
singularity exec --nv myscript.py 

The --nv option is mandatory for deep learning 

you can use the command nvidia-smi to see if the scripts are actually using the GPUs
