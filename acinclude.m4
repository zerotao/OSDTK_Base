dnl Your own macros go here

AC_DEFUN([AC_WITH_DEBUG],
[ AC_MSG_CHECKING(whether to enable/disable debugging)
  AC_ARG_WITH(debug,
  [  --with-debug[=level]    Enable debugging.
  --without-debug	  Disable debugging (default). ],
  [
	case "$with_debug" in
	     no)
		AC_MSG_RESULT(no)
		;;
	     yes)
	        AC_MSG_RESULT(-DDEBUG)
		CFLAGS="$CFLAGS -g -DDEBUG"
		;;
	     *)
	        AC_MSG_RESULT(-DDEBUG$with_debug)
		CFLAGS="$CFLAGS -g -DDEBUG$with_debug"
	        ;;
	esac
  ],
  [ AC_MSG_RESULT(no)
  ])
])

AC_DEFUN([AC_WITH_PROFILING],
[ AC_MSG_CHECKING(whether to enable/disable profiling)
  AC_ARG_WITH(profiling,
  [  --with-profiling[=flags]  Enable profiling.
  --without-profiling	  Disable profiling(default). ],
  [
	case "$with_debug" in
	     no)
		AC_MSG_RESULT(no)
		;;
	     yes)
	        AC_MSG_RESULT(yes)
		CFLAGS="$CFLAGS -pg"
		;;
	     *)
	        AC_MSG_RESULT(yes)
		CFLAGS="$CFLAGS -pg $with_profiling"
	        ;;
	esac
  ],
  [ AC_MSG_RESULT(no)
  ])
])
