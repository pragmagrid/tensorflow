VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python/lib/$(PYTHONVER)/site-packages
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-opencv-$(PYSHORT)
ARCHIVENAME     = opencv_python
VERSION         = 3.4.0.12
RELEASE         = 1
TARBALL_POSTFIX	= "cp36-cp36m-manylinux1_x86_64.whl"

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil}"

RPM.FILES = \
/opt/python/lib/python3.6/site-packages/opencv_python* \n \
/opt/python/lib/python3.6/site-packages/cv2/.libs/* \n \
/opt/python/lib/python3.6/site-packages/cv2/* 

