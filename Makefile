#!/usr/bin/make -f

SUBDIRS := etc/xdg/pardus/Thunar/po usr/bin/po/ usr/share/polkit-1/actions/po usr/share/pardus/xfce-settings/xdg-pardus-templates/po/

all:
	@echo "Nothing to build, call 'make install' instead."

install:
	mkdir -pv $(DESTDIR)
	cp -a etc usr $(DESTDIR)/.
	mkdir -pv $(DESTDIR)/usr/share/locale
	# po generation
	for i in $(SUBDIRS); do \
		make -C $(DESTDIR)/$$i; \
		rm -rf $(DESTDIR)/$$i; \
	done
	# remove some remaining files
	find $(DESTDIR) -type f -iname "*.in" | xargs rm -f

# vim:ts=4
