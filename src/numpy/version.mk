VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-numpy-$(PYSHORT)
ARCHIVENAME     = numpy
VERSION         = 1.14.2
RELEASE         = 0
TARBALL_POSTFIX	= zip

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil} "

RPM.FILES = \
/opt/python/bin/f2py3.6 \n \
/opt/python/lib/$(PYTHONVER)/site-packages/numpy/* \n \
/opt/python/lib/python3.6/site-packages/numpy-$(VERSION)*
