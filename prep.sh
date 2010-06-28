#!/bin/sh

usage() {
      echo "Usage: $0 [-t] <project_name>"
      echo " Options:"
      echo "  -t        Test (just show what I would do)"
      exit
}

TEST=0;

#
# commands to run
#
set -- $(getopt t "$@")
if [ $? -ne 0 ]; then 
    usage;
fi


while true; do
  case "$1" in
      -t) TEST=1; shift ;;
      --) shift; break ;;
      -h) usage ;;
      -*) usage ;;
      *) break ;;
  esac
done

if [ x"$1" = x"" ]; then
  usage;
else
  PROJECT=$1
fi

NEWFILES="README AUTHORS NEWS ChangeLog"
FILES="$NEWFILES COPYING INSTALL configure config.h.in aclocal.m4"
echo Removing \"$FILES\"
if [ "$TEST" -ne 1 ]; then 
    rm -f $FILES
else
    echo "rm -f $FILES"
fi

echo Making new versions of \"$NEWFILES\"
if [ "$TEST" -ne 1 ]; then 
    for file in $NEWFILES; do
	echo Touching $file
	touch $file
    done
fi

echo Removing CVS directories
if [ "$TEST" -ne 1 ]; then 
    find . -name CVS -exec rm -rf {} \; >& /dev/null
else
    echo "  find . -name CVS -exec rm -rf {} \; >& /dev/null"
fi
echo Removing extra files
if [ "$TEST" -ne 1 ]; then
    find . -name Makefile.in -exec rm -f {} \; >& /dev/null
    rm -f aux_files/*
else
    echo " find . -name Makefile.in -exec rm -f {} \;"
    echo " rm -f aux/*"
fi

echo Cleaning up OSDTK stuff in configure.in
VER=`grep AC_INIT configure.in | awk -F, '{ print $2 }'`
if [ "$TEST" -ne 1 ]; then
    sed -e "s/OSDTK_Base/$PROJECT/"                       \
	-e "s/jshiffer\@zerotao.org/user@unknown.domain/" \
	-e "/AC_INIT/s/$VER/0.1.0/"                       \
	< configure.in > configure.in.new
    mv configure.in.new configure.in
else
    cat <<EOF
sed -e "s/OSDTK_Base/$PROJECT/"
    -e "s/jshiffer\@zerotao.org/user@unknown.domain/"
    -e "/AC_INIT/s/$VER/0.1.0/"
< configure.in > configure.in.new
EOF
fi

echo Moving to dist version of Makefile.am
if [ "$TEST" -ne 1 ]; then
    mv Makefile.am.dist Makefile.am
fi

#do me last in case something messes up
echo Removing \"prep.sh\"
if [ "$TEST" -ne 1 ]; then
    rm -f ./prep.sh
fi
