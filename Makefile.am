SUBDIRS = src

noinst_SCRIPTS = \
	build-rpm

manifestdir = $(shell pwd)/tmp
Manifest: .FORCE
	@mkdir -p $(manifestdir)
	@make install DESTDIR=$(manifestdir)
	@(cd $(manifestdir)${prefix}; find . -type f) | sort > Manifest;
	@rm -rf $(manifestdir)

rpm: *.spec
	./build-rpm *.spec

.FORCE:

MAINTAINERCLEANFILES = \
	configure \
	aclocal.m4 \
	stamp-h.in \
	config.h.in \
	Makefile.in \
	aux/config.guess \
	aux/config.sub \
	aux/ltconfig \
	aux/ltmain.sh \
	aux/install-sh \
	aux/mkinstalldirs \
	aux/missing 

EXTRA_DIST = \
	Makefile.extra \
	build-rpm \
	autogen.sh \
	bootstrap \
	prep.sh \
	Makefile.am.dist

DISTCLEANFILES =    \
	configure   \
	stamp-h.in  \
	Makefile.in

# dist-hook:
# 	rm -f $(distdir)/configure
# 	find $(distdir) -name Makefile.in -exec rm {} \;
# 	rm -f $(distdir)/stamp-h.in
# 	mkdir $(distdir)/aux
