VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python/lib/$(PYTHONVER)/site-packages
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-tensorflowonspark-$(PYSHORT)
ARCHIVENAME     = tensorflowonspark
VERSION         = 1.2.1
RELEASE         = 0
TARBALL_POSTFIX	= "py2.py3-none-any.whl"

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nio}"

RPM.FILES = \
/opt/python/lib/python3.6/site-packages/tensorflowonspark-$(VERSION)* \n \
/opt/python/lib/python3.6/site-packages/tensorflowonspark/* 

