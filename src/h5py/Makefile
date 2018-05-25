
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
	unzip -d $(ROOT)/$(PKGROOT) $(ARCHIVENAME)-$(VERSION)-$(TARBALL_POSTFIX)

clean::
	rm -rf $(ARCHIVENAME) $(ARCHIVENAME)-$(VERSION).dist-info $(VERSION.MK.INCLUDE)
