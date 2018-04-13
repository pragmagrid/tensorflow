VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-absl-py-$(PYSHORT)
ARCHIVENAME     = absl-py
VERSION         = 0.1.13
RELEASE         = 1
TARBALL_POSTFIX	= "tar.gz"

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil} "

RPM.FILES = \
/opt/python/lib/python3.6/site-packages/absl_py-$(VERSION)* \n \
/opt/python/lib/python3.6/site-packages/absl/* 

