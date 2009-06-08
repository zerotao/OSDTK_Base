#!/bin/sh
# Run this to generate all the initial makefiles, configure, etc.

(test -d aux) || {
    mkdir aux;
}

(test -f prep.sh) && {
    echo You should run \"./prep.sh\" before running autogen.sh
    echo To get rid of the OSDTK specific stuff
    echo sleeping for 2 seconds
    sleep 2
}

#Sub projects you want to run configure in
PRGDIRS=""
#This directory
srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

#All of the directories together
PRGDIRS="$srcdir $PRGDIRS"
ORIGDIR=`pwd`

#Just checking
(test -f $srcdir/configure.in) || {
	echo "You must run this script in the top-level directory"
	exit 1
}

if test -z "$*"; then
	echo "I am going to run ./configure with no arguments - if you wish "
        echo "to pass any to it, please specify them on the $0 command line."
fi

for i in $PRGDIRS
do 
  echo processing $i
  (cd $i; \
    # Sets up for using libtool
    # libtoolize --copy --force; \
    # Generates config.h.in by scanning acconfig.h
    autoheader; \
    # Generates aclocal.m4 by scanning configure.in
    aclocal; \
    # Generates Makefile.in by scanning Makefile.am
    automake --add-missing; \
    # Generates configure by scanning configure.in
    autoconf)
done

cd $ORIGDIR
echo "Running $srcdir/configure --enable-maintainer-mode" "$@"
$srcdir/configure --enable-maintainer-mode "$@"
echo 
echo "Now type 'make' to compile"

