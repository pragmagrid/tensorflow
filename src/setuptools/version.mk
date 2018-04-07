VERSION.MK.MASTER = python.mk
VERSION.MK.MASTER.DIR = ../
VERSION.MK.INCLUDE = python.version.mk

include $(VERSION.MK.INCLUDE) 

PKGROOT = /opt/python
PY.PATH = /opt/python/bin/$(PYTHONVER)

NAME            = opt-setuptools-$(PYSHORT)
ARCHIVENAME     = setuptools
VERSION         = 39.0.1
RELEASE         = 0
TARBALL_POSTFIX	= zip

RPM.EXTRAS = "AutoReq: no" \
"%define __os_install_post  /usr/lib/rpm/brp-python-bytecompile %{nil} "

RPM.FILES = \
/opt/python/bin/easy_install-* \n \
/opt/python/lib/$(PYTHONVER)/site-packages/easy_install.* \n \
/opt/python/lib/$(PYTHONVER)/site-packages/pkg_resources \n \
/opt/python/lib/$(PYTHONVER)/site-packages/setuptools/* \n \
/opt/python/lib/$(PYTHONVER)/site-packages/setuptools-* 

