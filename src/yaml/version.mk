VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-yaml-$(PYSHORT)
ARCHIVENAME     =  PyYAML
VERSION         = 3.12
RELEASE         = 0
TARBALL_POSTFIX	= "tar.gz"

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil} "

RPM.FILES = \
/opt/python/lib/python3.6/site-packages/PyYAML-$(VERSION)* \n \
/opt/python/lib/python3.6/site-packages/yaml/*

