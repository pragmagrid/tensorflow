
REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

SHELL=/bin/bash

pretar:: $(VERSION.MK.INCLUDE)

$(VERSION.MK.INCLUDE): 
	if [ -f $(VERSION.MK.MASTER.DIR)/$(VERSION.MK.MASTER) ]; then \
	    /bin/cp $(VERSION.MK.MASTER.DIR)/$(VERSION.MK.MASTER) $@; \
	fi

build:
	tar xzvf $(ARCHIVENAME)-$(VERSION).$(TARBALL_POSTFIX)
	(\
	    cd $(ARCHIVENAME)-$(VERSION);   \
	    module load opt-python ;        \
	    $(PY.PATH) setup.py build;      \
	)

install::
	(\
	    cd $(ARCHIVENAME)-$(VERSION);           \
	    module load opt-python ;                \
	    $(PY.PATH) setup.py $@ --root=$(ROOT)/; \
	)

clean::
	rm -rf $(ARCHIVENAME)-$(VERSION) $(VERSION.MK.INCLUDE)
