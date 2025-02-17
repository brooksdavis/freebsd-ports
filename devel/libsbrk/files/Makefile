PACKAGE=	clibs
LIB=		sbrk
SHLIB_MAJOR=	1
LIBDIR?=	${PREFIX}/lib
MANDIR?=	${PREFIX}/share/man/man
MAN=		sbrk.2

LDFLAGS+=-Wl,--filter=libc.so.7
#VERSION_DEF=${SRCTOP}/lib/libc/Versions.def
SYMBOL_MAPS=${.CURDIR}/Symbol.map

SRCS=		${LIB}.c

.include <bsd.lib.mk>
