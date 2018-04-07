
REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

pretar:: $(VERSION.MK.INCLUDE)

$(VERSION.MK.INCLUDE): 
	if [ -f $(VERSION.MK.MASTER.DIR)/$(VERSION.MK.MASTER) ]; then \
	    /bin/cp $(VERSION.MK.MASTER.DIR)/$(VERSION.MK.MASTER) $@; \
	fi

build:

install::
	mkdir -p $(ROOT)/$(PKGROOT)
	unzip $(ARCHIVENAME)-$(VERSION)-$(TARBALL_POSTFIX)
	/bin/mv tensorflow-1.7.0.data/purelib/* tensorflow-1.7.0.dist-info  $(ROOT)/$(PKGROOT) 

clean::
	rm -rf $(ARCHIVENAME)-$(VERSION).data $(ARCHIVENAME)-$(VERSION).dist-info $(VERSION.MK.INCLUDE)
