# nwm version
VERSION = 1.0

# OS
OS = FREEBSD
#OS = LINUX

# paths
PREFIX = /usr/local

# includes and libs
INCS = -I. -I/usr/include -I${X11INC}
LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 

CPPFLAGS = -DVERSION=\"${VERSION}\" 

ifeq ($(OS),LINUX)
  MANPREFIX = ${PREFIX}/share/man
  X11INC = /usr/X11R6/include
  X11LIB = /usr/X11R6/lib
  CFLAGS = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
  LDFLAGS = -g ${LIBS}
endif

ifeq ($(OS),FREEBSD)
  MANPREFIX = ${PREFIX}/man
  X11INC = ${PREFIX}/include
  X11LIB = ${PREFIX}/lib
  CFLAGS = -std=c99 ${INCS} ${CPPFLAGS} -D${OS}
  LDFLAGS = ${LIBS}
endif

# compiler and linker
CC = cc
