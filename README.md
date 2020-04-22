# singularity
Singularity set up for Deep Learning

ON BARACUDA :

Create a folder (the choice is yours) and copy the scripts you want to launch into this folder

In this folder copy from /mnt/cbib/baracuda/singularity_img/tensorflow:

- tf_keras.simg
- tf_keras.def

Create a singularity Instance :
singularity instance start --nv tf_keras.simg instance_name_GPU_Number

Enter the Shell of this instance :
singularity shell --nv instance://instance_name_GPU_Number

Create a conda environment :
``` shell
conda create -n env_name python=3.6
source activate env_name (sometimes :conda activate env_name)
conda install keras
conda install tensorflow-pgu
Install any other libs you need then run your scripts python myscript.py
```

To get off the instance shell just type "exit"

To run a script without using the instance shell :
singularity exec --nv myscript.py 

The --nv option is mandatory for deep learning 

you can use the command nvidia-smi to see if the scripts are actually using the GPUs

Specify GPU : 
Specify the GPUs you are using in your scripts with : 

```
import os
os.environ["CUDA_VISIBLE_DEVICES"] = "1"
```


UPDATE:
​
## Screen 
​
To run jobs without keeping a terminal openned, we use screen. 
​
```bash
screen -S session_name # This session_name will help you to remember what's running inside the screen instance and retrieve it easily
```
To quit without closing the session just do : `CTRL+a` then `d`
​
Now that we have created a session, we need to create a script to run our job on singularity : 
​
`script.sh` :
```bash
#!/bin/bash
source activate env_name
cd /absolute/path/to/your/DL/job
python job.py
python job.py > output.log # use this one if you want to keep all the log 
```
​
Go back into the screen session and run the script : 
```bash 
screen -r session_name
singularity exec --nv instance://instance_name bash script.sh
```
​
Usefull screen cmd : 
​
- screen -ls : list all screen instance (only yours)
- screen -S name : create a session named name
- screen -r name : rattach to session name
​
Inside screen : 
​
- CTRL+a d : detach session
​
​
More information at : https://linuxize.com/post/how-to-use-linux-screen/


