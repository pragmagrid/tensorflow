# Tensorflow Roll 
Installs Tensorflow and its dependencies

Chekout the roll source
```bash
git clone https://github.com/pragmagrid/tensorflow
```

###  Prerequisits
This section lists all the prerequisites and tensorflow dependencies.
The dependencies are either build from source or installed from RPMs 
during the roll build.

- absl-py-0.1.13.tar.gz
- astor-0.6.2.tar.gz
- bazel-0.11.1-1.el7.centos.x86_64.rpm
- bleach-2.1.3.tar.gz
- chardet-3.0.4.tar.gz
- cudnn-8.0-linux-x64-v7.1.tar.gz
- dev-0.4.0.tar.gz
- elephas-0.3.tar.gz
- gast-0.2.0.tar.gz
- grpcio-1.10.0.tar.gz
- html5lib-1.0.1.tar.gz
- Keras-2.1.5.tar.gz
- numpy-1.14.2.zip
- opencv_python-3.4.0.12-cp36-cp36m-manylinux1_x86_64.whl
- Pillow-5.1.0.tar.gz
- protobuf-3.5.2.tar.gz
- PyYAML-3.12.tar.gz
- scipy-1.0.1.tar.gz
- setuptools-39.0.1.zip
- six-1.11.0.tar.gz
- tensorboard-1.7.0-py3-none-any.whl
- tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl
- tensorflowonspark-1.2.1-py2.py3-none-any.whl
- termcolor-1.1.0.tar.gz
- tensorflow v1.7.0.tar.gz
- webencodings-0.5.1.tar.gz
- wheel-0.30.0.tar.gz
- h5py-2.7.1-cp36-cp36m-manylinux1_x86_64.whl

### Create tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl

This is a list of commands used to produce tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl file.
The resulting file is now added to the google drive and is downloaded and included as an RPM distro
when building the roll.  The following instructions are an example of HOWTO.
Started with the  initial install instructions from source https://www.tensorflow.org/install/install_sources#ConfigureInstallation

1. Download and install tensorboard, needed as a prerequisite before building tensorflow.
   - Get tensorboard-1.7.0-py3-none-any.whl  from https://pypi.org/project/tensorboard/1.7.0/#files
   - Install tensorboard python wheel file 
     ```bash
      python3.6 -m wheel install  tensorboard-1.7.0-py3-none-any.whl 
      ```
1. set environment
   add link, this is a stub that functions for library that is provided by cuda driver and does not exist on non-GPU host
   ```bash
   ln -s /opt/cuda_8.0.61/lib64/stubs/libcuda.so /opt/cuda_8.0.61/lib64/stubs/libcuda.so.1
   ```
1. For bazel need to install java-1.8.0-openjdk-devel RPM
   JAVA_HOME and is set in /etc/profile.d/java.[sh,csh] files but the link does not exists
   TODO: rework this later (as module?)
   ```bash
   mkdir /usr/java
   ln -s /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/ /usr/java/latest
   ```
1. donwload and install bazel rpm. The script will download the  epel repo file, installs it
   and then download need RPM.
   ```bash
    cd src/bazel; 
    ./getBazelRpm.sh
    rpm -i bazel-0.11.1-1.el7.centos.x86_64.rpm 
   ```
1. install cuda-modules and cuda-libs rpm from cuda roll
1. lLoad cuda and python modules 
   ```bash
   module load cuda
   module load opt-python
   ```
1. make and install opt-cudnn RPM
   ```bash
   cd src/cudann
   make rpm
   rpm -i ../../RPMS/x86_64/opt-cudnn-7.1-0.x86_64.rpm
   ```
1. create device that is not available in cuda install. tensorflow configure needs 10:
   ```bash
   cd /opt/cuda_8.0.61/nvvm/libdevice/
   ln -s libdevice.compute_50.10.bc libdevice.10.bc
   ```
1. download tensorflow
   ``` bash
   cd src/tensorflow
   wget https://github.com/tensorflow/tensorflow/archive/v1.7.0.tar.gz
   ```
   untar distro  
   ```bash
   tar xzvf v1.7.0.tar.gz
   cd tensorflow-1.7.0/
   ```
1. run configure and answer questions
   ```bash
   ./configure
   ```
   During  configure answer questions. 
   - 	use cuda 8.0, cuDNN 7.1 (per isntalled)
   - 	use /opt/python/bin/python3.6
   - 	use capability 3.5,6.1 (reported by deviceQuery for the GPU on cuda-enabled host)
   - 	accept suggested defaults for the rest
1. after configure is run there are .bazelrc and .tf_configure.bazelrc files (saved as dot.bazelrc and dot.tf_configure.bazelrc in src/tensorflow )
   and the following linkes
   - bazel-bin              -> /root/.cache/bazel/_bazel_root/c34f0c5...
   - bazel-genfiles         -> /root/.cache/bazel/_bazel_root/c34f0c5...
   - bazel-out              -> /root/.cache/bazel/_bazel_root/c34f0c5...
   - bazel-tensorflow-1.7.0 -> /root/.cache/bazel/_bazel_root/c34f0c5...
   - bazel-testlogs         -> /root/.cache/bazel/_bazel_root/c34f0c5...

1. build tensorflow
   ```bash
   bazel build --verbose_failures --action_env="LD_LIBRARY_PATH=${LD_LIBRARY_PATH}" \
            --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
   ```
1. build pip package
   ```bash
   bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
   ```
1. save resulting wheel file
   ```bash
   mv /tmp/tensorflow_pkg/tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl .
   ```
1. make RPM per Makefile/version.mk

###  Building a roll

At the top of the roll src tree execute 
```bash
make roll
```

### Installing

To add this roll to existing cluster, execute these instructions on a Rocks frontend:
```bash
rocks add roll tensorflow-*.x86_64.disk1.iso
rocks enable roll tensorflow
(cd /export/rocks/install; rocks create distro)
rocks run roll tensorflow > add-roll.sh
bash add-roll.sh
```
