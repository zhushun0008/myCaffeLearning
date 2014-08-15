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

#### Week 02's mission
