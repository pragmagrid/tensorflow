VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-dev-$(PYSHORT)
ARCHIVENAME     = dev
VERSION         = 0.4.0
RELEASE         = 0
TARBALL_POSTFIX	= "tar.gz"

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil}"

RPM.FILES = \
/opt/python/lib/python3.6/site-packages/dev-$(VERSION)* \n \
/opt/python/lib/python3.6/site-packages/dev/* 

