CUDA = 8.0.61
PKGROOT = /opt/cuda_$(CUDA)
NAME            = opt-cudnn
ARCHIVENAME     = cudnn-8.0-linux-x64-v$(VERSION)
VERSION         = 7.1
RELEASE         = 0
TARBALL_POSTFIX	= "tar.gz"

SAMPLESDISTRO = libcudnn7-doc_7.1.2.21-1+cuda8.0_amd64.deb 
SAMPLES = data.tar.xz  

RPM.EXTRAS = "AutoReq: no" 

RPM.FILES = \
$(PKGROOT)/include/cudnn.h \n \
$(PKGROOT)/NVIDIA_SLA_cuDNN_Support.txt \n \
$(PKGROOT)/lib64/libcudnn* \n \
$(PKGROOT)/doc/libcudnn7-doc/* \n \
$(PKGROOT)/samples/cudnn_samples_v7/*


