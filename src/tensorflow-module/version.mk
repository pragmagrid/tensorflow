VERSION.MK.MASTER = version.mk
VERSION.MK.MASTER.DIR = ../tensorflow
VERSION.MK.INCLUDE = tensorflow.version.mk

include $(VERSION.MK.INCLUDE) 
MODNAME  = tensorflow
NAME	= tensorflow-module$(TOOLKIT_SHORT)
PKGROOT = /usr/share/Modules/modulefiles
RELEASE = 0
MODULE_DEST = $(PKGROOT)

RPM.REQUIRES = environment-modules

RPM.FILES = \
$(MODULE_DEST)/tensorflow
