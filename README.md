myCaffeLearning
===============

### This project is for me to configure the caffe environment and to use it for our research.
#### Week 01's mission: successfully running Caffe
1. CUDA 6.0  installed 
2. compilation 
3. Test

#### Installation on Windows(not finished )
##### 01 Install Ultimate Visual Studio 2012(Success)
* Downloading VS2012
* Installing VS2012
  * If there is a serious problem occuring, please reference to 
    * http://bbs.csdn.net/topics/390379950
       * uninstall Microsoft .NET Framework4.5
       * Re-installing VS2012
  * I have successfully installed VS2012 after uninstall Microsoft .NET Framework4.5
  
##### 02. Install CUDA Toolkit 6.0(Success)
* Reference to 
   *  http://docs.nvidia.com/cuda/index.html#axzz39zwcGIkL
##### 03. Compilation(Failed)
###### Compilation is really complex on windows

* Aren't fimilar with VS2012
* Do not know how to modify the files to complete compilation
* Little documents are aviaiable 

#### Installation on Ubuntu(just started)
##### 01 Installing Ubuntu on windows 7(failed)
1. win7 fenqu
 * 控制面板\系统和安全\管理工具 
 * http://pcedu.pconline.com.cn/windows7/skill/1105/2416991_all.html 
 *
2. fsfsdfs
 * http://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/
 * http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows
   * if universal-usb-installer could not find the ISO file, please rename the ISO file like ubuntu-12.04-desktop-amd64(the correct name is needed for beed recognized by universal-usb-installer)

##### 01.01 Alternative option: directly install Ubuntu 12.04 and overwrite the Windows 7 (Success) 
###### 01. nned to record how to install
* BIOS setup with USB
* Use UtraISO to write Bbuntu 12.04 to U-Flash(recommending more than 2G szie but I used a 16G U-Flash)
* Install operation system
*
#### 02 Install CUDA-Linux(Sucess)

#### 03 Compilation (Success)
* make all (Success)
* make test (Success)
* make runtest (Success)
##### errors
1. cblas.h: No such file or directory
  * ATLAS: free, open source, and so the default for Caffe.
  * sudo apt-get install libatlas-base-dev
2. opencv2/core/core.hpp: No such file or directory
  * Install Opencv
  * http://www.raben.com/book/export/html/3
  * http://docs.opencv.org/doc/tutorials/introduction/linux_install/linux_install.html
  {{{cd ~/opencv
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..}}}
3. libcudart.so.6.0: cannot open shared object file: No such file or directory when run make runtest
 * export LD_LIBRARY_PATH=:/usr/local/cuda/lib64
 * make runtest again


#### 03 install MATLAB R2013b for Linux/Ubuntu
* http://blog.sina.com.cn/s/blog_e126b6140101jk3j.html

#### Week 02 - 03's mission : Knowing Caffe
1. Use Caffe to train MINIST dataset(LeNet)
2. Use Caffe to train ImageNet
3. How to configure the netwwork architecture with Protocal Buffer
4. Use Caffe to train ImageNet

#### 01 Use Use Caffe to train MINIST dataset(LeNet) (Success)
Did the experiment following the link below
http://caffe.berkeleyvision.org/gathered/examples/mnist.html
In this experiment, the sample codes to train a LeNet for MINIST dataset
* Define the neural network architecture
   *  need to code 
     *  train.prototxt, test.prototxt (network architecture LeNet here)
     *  solver.prototxt (training parameters defined here)

#### 03 Transform Caffe to cuda-convnet
##### 1. Why?
1. After reading 'Learning a Deep Conv. Network For Image Super-Resolution' again, I found their implementation based on convnet[14], which is cuda-convnet  
2. Caffe supports cross entropy and softmax as the loss function which are well-known lelated to probability and widely used for classification problem. If you want to see why most people use cross entropy(usually for 0/1 classification) as cost function usually for 0/1 classification and softmax as cost function usually for multi-classification. You could reference to link below. Unfortunately, Caffe does not support Sum of Square as cost function. To reduce the time we spend to implement the CNN we want, I change to cuda-convnet. 
  * why do people use cross entropy
    * from page 15 of Lecture 6   
      * https://onedrive.live.com/view.aspx?cid=463E1A10579138DE&resid=463E1A10579138DE%2114002&app=WordPdf
  * Why do people use softmax
    * http://cs229.stanford.edu/notes/cs229-notes1.pdf
3. Caffe and Cuda-convnet have similar interface.
  * Define Network architecture
  * Configure the Network parameters
  * Implement a own function to manipulate the original data to meet the requirement of the input of these 2 modules
 
##### 2. Train CIFAR-10 dataSet(Success)
1. running the demo code.
  1. Compiling -- how to check out and compile this code.
  2. Data -- what kind of data this net can train on.(CIFAR-10 dataSet)
       * http://www.cs.toronto.edu/~kriz/cifar.html
  3. LayerParams -- how to specify an architecture for the net. (Define Net architecture and parameters)
       * https://code.google.com/p/cuda-convnet/source/browse/trunk/example-layers/layers-conv-local-11pct.cfg
       * https://code.google.com/p/cuda-convnet/source/browse/trunk/example-layers/layer-params-conv-local-11pct.cfg
  4. NeuronTypes -- types of hidden unit nonlinearities.
  5. TrainingNet -- how to train the net.
  6. Options -- the command-line arguments that the net takes.
  7. ViewingNet -- how to look inside the checkpoints saved by the net.
  8. CheckingGradients -- how to numerically test the gradients for correctness.

2. Our work may have 2 things
   * Write the python code to format data as input of nueral
   * One-layer autoencoder deployed with cuda-convnet
      * one layer autoencoder is simple and easy to check whether our network work correctly
      * Check whether Sum of Square as cost function works correctly
      * Change classification to Regression

#### 04 Deploy neural network on the paper 'Learning a Deep Convolutional Network for Images Super-Resolution'
1. Auto-encoder to check sum of squre works well
   * layer-def
   * layer-params

2.Deep Convolutional Network for Images Super-Resolution
  1. Data is suitalbe for cuda-convet
      * MRdata_provider.py
  2. Deploy neural network
      * layer-def
      * layer-params

    
