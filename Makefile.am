## Process this file with automake to produce Makefile.in

include meta/automake/mmck-rules.make


#### documentation

EXTRA_DIST		+= doc/mmck-chicken-docs.style.css
CLEANFILES		+= doc/mmck-chicken-docs.css
AM_MAKEINFOHTMLFLAGS	+= --css-ref=mmck-chicken-docs.css

info_TEXINFOS		= doc/mmck-records.texi
doc_mmck_records_TEXINFOS = \
	doc/macros.texi			\
	doc/lgpl-3.0.texi		\
	doc/fdl-1.3.texi

## --------------------------------------------------------------------

doc/mmck-records.html/$(am__dirstamp): doc/$(am__dirstamp)
	@$(MKDIR_P) doc/mmck-records.html/
	@: > doc/mmck-records.html/$(am__dirstamp)

doc/mmck-records.html/mmck-chicken-docs.css: doc/mmck-chicken-docs.style.css doc/mmck-records.html/$(am__dirstamp)
	$(INSTALL) -m 0444 "$(top_srcdir)/doc/mmck-chicken-docs.style.css" "$(builddir)/doc/mmck-records.html/mmck-chicken-docs.css"

## --------------------------------------------------------------------

html-local: doc/mmck-records.html/mmck-chicken-docs.css

install-html-local:
	$(MKDIR_P) "$(DESTDIR)$(htmldir)/mmck-records.html/"
	$(INSTALL) -m 0444 $(builddir)/doc/mmck-records.html/mmck-chicken-docs.css "$(DESTDIR)$(htmldir)/mmck-records.html/"


#### library build targets

# All the source files ".scm" of the extension library.
#
MMCK_RECORDS_MODULES		=

# All  the object  files ".o"  that must  be linked  in the  extension
# library.
#
MMCK_RECORDS_RUNTIME_OBJECTS	=

# All  the  source files  ".import.scm"  of  all the  modules'  import
# libraries.
#
MMCK_RECORDS_IMPORT_SOURCES	=

# The  module's  import  libraries ".import.$(MMCK_SOEXT)"  needed  to
# compile main  module's object  file.  It does  not include  the main
# import library:
#
#   lib/mmck.records.import.$(MMCK_SOEXT)
#
MMCK_RECORDS_IMPORT_DEPS		=

# The import  libraries ".import.$(MMCK_SOEXT)" needed to  compile new
# code using the  shared library "(mmck records)".  We  need to build
# and install all of them.
#
MMCK_RECORDS_IMPORT_SHARED_LIBS	=

# This is the "(mmck records)" shared library file pathname.
#
MMCK_RECORDS_RUNTIME_SHARED_LIBS	= \
	lib/mmck.records.$(MMCK_SOEXT)		\
	lib/mmck.records.helpers.$(MMCK_SOEXT)

# Temporary  files  we need  for  parallel  builds, ".temp",  ".lock",
# ".stamp".
#
MMCK_RECORDS_TEMP_FILES		=


#### library (mmck records): module version

MMCK_RECORDS_MODULES		+= lib/mmck.records.version.scm
MMCK_RECORDS_RUNTIME_OBJECTS	+= lib/mmck.records.version.$(OBJEXT)
MMCK_RECORDS_IMPORT_SOURCES	+= lib/mmck.records.version.import.scm
MMCK_RECORDS_IMPORT_DEPS	+= lib/mmck.records.version.import.$(MMCK_SOEXT)
MMCK_RECORDS_IMPORT_SHARED_LIBS	+= lib/mmck.records.version.import.$(MMCK_SOEXT)
MMCK_RECORDS_TEMP_FILES		+= \
	lib/mmck.records.version.temp				\
	lib/mmck.records.version.lock				\
	lib/mmck.records.version.stamp

# A compiler  invokation to build  an object file, also  generates the
# source  file for  the import  library; a  single rule  generates two
# targets.  We implement  the rules as suggested  in the documentation
# of GNU Automake, node "Multiple Outputs".
#
# It is ugly, I know.  But it  is supposed to support all the cases of
# parallel build and dry runs.  (Marco Maggi; May  4, 2019)
#
lib/mmck.records.version.stamp: lib/mmck.records.version.scm $(MMCK_OBJECTS_DEPS)
	@rm -f lib/mmck.records.version.temp
	@touch lib/mmck.records.version.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.records.version.$(OBJEXT) $(<) -prologue lib/config.scm
	@$(MV) mmck.records.version.import.scm lib/mmck.records.version.import.scm
	@mv -f lib/mmck.records.version.temp $@

lib/mmck.records.version.import.scm lib/mmck.records.version.$(OBJEXT): lib/mmck.records.version.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.records.version.lock lib/mmck.records.version.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.records.version.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.records.version.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.records.version.stamp; \
	    $$dry rmdir lib/mmck.records.version.lock; \
	  else \
	    while test -d lib/mmck.records.version.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.records.version.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.records.version.import.$(MMCK_SOEXT): lib/mmck.records.version.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)


#### library (mmck records): module helpers

MMCK_RECORDS_MODULES		+= lib/mmck.records.helpers.scm
MMCK_RECORDS_RUNTIME_OBJECTS	+= lib/mmck.records.helpers.$(OBJEXT)
MMCK_RECORDS_IMPORT_SOURCES	+= lib/mmck.records.helpers.import.scm
MMCK_RECORDS_IMPORT_DEPS	+= lib/mmck.records.helpers.import.$(MMCK_SOEXT)
MMCK_RECORDS_IMPORT_SHARED_LIBS	+= lib/mmck.records.helpers.import.$(MMCK_SOEXT)
MMCK_RECORDS_TEMP_FILES		+= \
	lib/mmck.records.helpers.temp				\
	lib/mmck.records.helpers.lock				\
	lib/mmck.records.helpers.stamp

lib/mmck.records.helpers.stamp: lib/mmck.records.helpers.scm $(MMCK_OBJECTS_DEPS)
	@rm -f lib/mmck.records.helpers.temp
	@touch lib/mmck.records.helpers.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.records.helpers.$(OBJEXT) $(<) -prologue lib/config.scm
	@$(MV) mmck.records.helpers.import.scm lib/mmck.records.helpers.import.scm
	@mv -f lib/mmck.records.helpers.temp $@

lib/mmck.records.helpers.import.scm lib/mmck.records.helpers.$(OBJEXT): lib/mmck.records.helpers.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.records.helpers.lock lib/mmck.records.helpers.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.records.helpers.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.records.helpers.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.records.helpers.stamp; \
	    $$dry rmdir lib/mmck.records.helpers.lock; \
	  else \
	    while test -d lib/mmck.records.helpers.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.records.helpers.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.records.helpers.import.$(MMCK_SOEXT): lib/mmck.records.helpers.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

# We build this libraries to use  its facilities at expand-time in the
# other modules; we would like not to install it!
#
# But this  library is also needed  to run the test  suite; this means
# the  rule "make  installcheck" will  work  only if  we install  this
# library too.  So we do it.  In the end it is a very small library...
#
# Maybe we could do some trick with GNU Automake's substitution symbol
# @MAINTAINER_MODE_TRUE@ which (it is my understanding):
#
# * Expands to the empty string when maintainer mode is enabled.
#
# * Expands to the comment character when maintainer mode is disabled.
#
# With this we could include/exclude  the installation of this library
# depending on the mode.  We are not doing it right now.
#
# Life is hard!  (Marco Maggi; May 30, 2019)
#
lib/mmck.records.helpers.$(MMCK_SOEXT): lib/mmck.records.helpers.$(OBJEXT)
	$(MMCK_LIB_ENV) $(CSC_LINK_LIBRARY) $(@) $(^)


#### library (mmck records): module procedural

MMCK_RECORDS_MODULES		+= lib/mmck.records.procedural.scm
MMCK_RECORDS_RUNTIME_OBJECTS	+= lib/mmck.records.procedural.$(OBJEXT)
MMCK_RECORDS_IMPORT_SOURCES	+= lib/mmck.records.procedural.import.scm
MMCK_RECORDS_IMPORT_DEPS	+= lib/mmck.records.procedural.import.$(MMCK_SOEXT)
MMCK_RECORDS_IMPORT_SHARED_LIBS	+= lib/mmck.records.procedural.import.$(MMCK_SOEXT)
MMCK_RECORDS_TEMP_FILES		+= \
	lib/mmck.records.procedural.temp	\
	lib/mmck.records.procedural.lock	\
	lib/mmck.records.procedural.stamp

MMCK_RECORDS_PROCEDURAL_DEPS = \
	lib/mmck.records.helpers.import.$(MMCK_SOEXT)		\
	$(MMCK_OBJECTS_DEPS)					\
	lib/mmck.records.helpers.$(MMCK_SOEXT)

lib/mmck.records.procedural.stamp: lib/mmck.records.procedural.scm $(MMCK_RECORDS_PROCEDURAL_DEPS)
	@rm -f lib/mmck.records.procedural.temp
	@touch lib/mmck.records.procedural.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.records.procedural.$(OBJEXT) $(<)
	@$(MV) mmck.records.procedural.import.scm lib/mmck.records.procedural.import.scm
	@mv -f lib/mmck.records.procedural.temp $@

lib/mmck.records.procedural.import.scm lib/mmck.records.procedural.$(OBJEXT): lib/mmck.records.procedural.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.records.procedural.lock lib/mmck.records.procedural.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.records.procedural.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.records.procedural.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.records.procedural.stamp; \
	    $$dry rmdir lib/mmck.records.procedural.lock; \
	  else \
	    while test -d lib/mmck.records.procedural.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.records.procedural.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.records.procedural.import.$(MMCK_SOEXT): lib/mmck.records.procedural.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)


#### library (mmck records): module syntactic

MMCK_RECORDS_MODULES		+= lib/mmck.records.syntactic.scm
MMCK_RECORDS_RUNTIME_OBJECTS	+= lib/mmck.records.syntactic.$(OBJEXT)
MMCK_RECORDS_IMPORT_SOURCES	+= lib/mmck.records.syntactic.import.scm
MMCK_RECORDS_IMPORT_DEPS	+= lib/mmck.records.syntactic.import.$(MMCK_SOEXT)
MMCK_RECORDS_IMPORT_SHARED_LIBS	+= lib/mmck.records.syntactic.import.$(MMCK_SOEXT)
MMCK_RECORDS_TEMP_FILES		+= \
	lib/mmck.records.syntactic.temp		\
	lib/mmck.records.syntactic.lock		\
	lib/mmck.records.syntactic.stamp

MMCK_RECORDS_SYNTACTIC_DEPS = \
	lib/mmck.records.helpers.import.$(MMCK_SOEXT)		\
	lib/mmck.records.procedural.import.$(MMCK_SOEXT)	\
	$(MMCK_OBJECTS_DEPS)					\
	lib/mmck.records.helpers.$(MMCK_SOEXT)

lib/mmck.records.syntactic.stamp: lib/mmck.records.syntactic.scm $(MMCK_RECORDS_SYNTACTIC_DEPS)
	@rm -f lib/mmck.records.syntactic.temp
	@touch lib/mmck.records.syntactic.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.records.syntactic.$(OBJEXT) $(<)
	@$(MV) mmck.records.syntactic.import.scm lib/mmck.records.syntactic.import.scm
	@mv -f lib/mmck.records.syntactic.temp $@

lib/mmck.records.syntactic.import.scm lib/mmck.records.syntactic.$(OBJEXT): lib/mmck.records.syntactic.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.records.syntactic.lock lib/mmck.records.syntactic.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.records.syntactic.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.records.syntactic.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.records.syntactic.stamp; \
	    $$dry rmdir lib/mmck.records.syntactic.lock; \
	  else \
	    while test -d lib/mmck.records.syntactic.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.records.syntactic.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.records.syntactic.import.$(MMCK_SOEXT): lib/mmck.records.syntactic.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)


#### library (mmck records): main module

MMCK_RECORDS_MODULES		+= lib/mmck.records.scm
MMCK_RECORDS_RUNTIME_OBJECTS	+= lib/mmck.records.$(OBJEXT)
MMCK_RECORDS_IMPORT_SOURCES	+= lib/mmck.records.import.scm
MMCK_RECORDS_IMPORT_SHARED_LIBS	+= lib/mmck.records.import.$(MMCK_SOEXT)
MMCK_RECORDS_TEMP_FILES		+= \
	lib/mmck.records.temp				\
	lib/mmck.records.lock				\
	lib/mmck.records.stamp

# This is the main compilation unit and it defines the main module; it
# depends upon all the import libraries of the other modules.
#
lib/mmck.records.stamp: lib/mmck.records.scm $(MMCK_RECORDS_IMPORT_DEPS) $(MMCK_OBJECTS_DEPS)
	@rm -f lib/mmck.records.temp
	@touch lib/mmck.records.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.records.$(OBJEXT) $(<)
	@$(MV) mmck.records.import.scm lib/mmck.records.import.scm
	@mv -f lib/mmck.records.temp $@

lib/mmck.records.import.scm lib/mmck.records.$(OBJEXT): lib/mmck.records.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.records.lock lib/mmck.records.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.records.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.records.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.records.stamp; \
	    $$dry rmdir lib/mmck.records.lock; \
	  else \
	    while test -d lib/mmck.records.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.records.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.records.import.$(MMCK_SOEXT): lib/mmck.records.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)


#### library (mmck records): wrapping up

EXTRA_DIST	+= $(MMCK_RECORDS_MODULES)

CLEANFILES	+= \
	$(MMCK_RECORDS_RUNTIME_SHARED_LIBS)	\
	$(MMCK_RECORDS_RUNTIME_OBJECTS)		\
	$(MMCK_RECORDS_IMPORT_SHARED_LIBS)	\
	$(MMCK_RECORDS_IMPORT_SOURCES)		\
	$(MMCK_RECORDS_TEMP_FILES)

lib/mmck.records.$(MMCK_SOEXT): $(MMCK_RECORDS_RUNTIME_OBJECTS)
	$(MMCK_LIB_ENV) $(CSC_LINK_LIBRARY) $(@) $(^)


#### shared libraries installation

# All the import shared libraries that we want to installe.
#
MMCK_ALL_IMPORT_SHARED_LIBS	= \
	$(MMCK_RECORDS_IMPORT_SHARED_LIBS)

# All the runtime shared libraries that we want to install.
#
MMCK_ALL_RUNTIME_SHARED_LIBS	= \
	$(MMCK_RECORDS_RUNTIME_SHARED_LIBS)

# These variables are parsed by GNU Automake to build the main library
# targets and install them under the directory $(MMUX_CHICKEN_LIBDIR).
#
# We are shamelessly cheating by  installing them using GNU Automake's
# primary  suffix  "_SCRIPTS"; these  are  not  scripts!  Scripts  are
# installed with the permissions 0755, which, for some reason, is what
# we want  for shared libraries.
#
# We  could use  the  primary suffix  "_DATA", but  we  would get  the
# permissions 0644.
#
sharedlibdir		= $(MMUX_CHICKEN_LIBDIR)
sharedlib_SCRIPTS	= $(MMCK_ALL_RUNTIME_SHARED_LIBS) $(MMCK_ALL_IMPORT_SHARED_LIBS)


#### interface to "make check"
#
# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#

# The list of object files.  We will store it in CLEANFILES.
#
MMCK_CHECK_OBJECTS	=

# The list of test programs.  We will set TESTS to it.
#
MMCK_CHECK_PROGS	=

# Dependencies common to all the test programs.
#
MMCK_CHECK_DEPS		+= $(MMCK_ALL_RUNTIME_SHARED_LIBS) $(MMCK_ALL_IMPORT_LIBS)

## --------------------------------------------------------------------

EXTRA_DIST		+= tests/test-version.scm
MMCK_CHECK_OBJECTS	+= tests/test-version.$(OBJEXT)
MMCK_CHECK_PROGS	+= tests/test-version.exe

tests/test-version.$(OBJEXT): tests/test-version.scm $(MMCK_CHECK_DEPS)
	$(MMCK_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)

tests/test-version.exe: tests/test-version.$(OBJEXT)
	$(MMCK_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)

## --------------------------------------------------------------------

EXTRA_DIST		+= tests/test-records-procedural.scm
MMCK_CHECK_OBJECTS	+= tests/test-records-procedural.$(OBJEXT)
MMCK_CHECK_PROGS	+= tests/test-records-procedural.exe

tests/test-records-procedural.$(OBJEXT): tests/test-records-procedural.scm $(MMCK_CHECK_DEPS)
	$(MMCK_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)

tests/test-records-procedural.exe: tests/test-records-procedural.$(OBJEXT)
	$(MMCK_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)

## --------------------------------------------------------------------

EXTRA_DIST		+= tests/test-records-syntactic.scm
MMCK_CHECK_OBJECTS	+= tests/test-records-syntactic.$(OBJEXT)
MMCK_CHECK_PROGS	+= tests/test-records-syntactic.exe

tests/test-records-syntactic.$(OBJEXT): tests/test-records-syntactic.scm $(MMCK_CHECK_DEPS)
	$(MMCK_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)

tests/test-records-syntactic.exe: tests/test-records-syntactic.$(OBJEXT)
	$(MMCK_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)


#### wrapping up tests

CLEANFILES	+= $(MMCK_CHECK_PROGS) $(MMCK_CHECK_OBJECTS)

if MMCK_TESTING_ENABLED
TESTS		= $(MMCK_CHECK_PROGS)
endif

### end of file
