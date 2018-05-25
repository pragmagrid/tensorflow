VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python/lib/$(PYTHONVER)/site-packages
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-h5py-$(PYSHORT)
ARCHIVENAME     = h5py
VERSION         = 2.7.1
RELEASE         = 1
TARBALL_POSTFIX	= "cp36-cp36m-manylinux1_x86_64.whl"

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil}"

RPM.FILES = \
/opt/python/lib/python3.6/site-packages/h5py* 
