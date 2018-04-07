VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python/lib/$(PYTHONVER)/site-packages
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-tensorflow-$(PYSHORT)
ARCHIVENAME     = tensorflow
VERSION         = 1.7.0
RELEASE         = 0
TARBALL_POSTFIX	= "cp36-cp36m-linux_x86_64.whl"

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil}"

RPM.FILES = \
/opt/python/lib/python3.6/site-packages/tensorflow-$(VERSION)* \n \
/opt/python/lib/python3.6/site-packages/tensorflow/* \n \
/opt/python/lib/python3.6/site-packages/external/* 

