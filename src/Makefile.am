bin_PROGRAMS = project
lib_LTLIBRARIES = libfoo.la

project_LDADD = libfoo.la

project_SOURCES = \
	main.c

noinst_HEADERS = \
	main.h

libfoo_la_SOURCES = \
        foo.c

pkincludedir = ${includedir}/foo
pkginclude_HEADERS = \
        foo.h

include $(top_srcdir)/Makefile.extra