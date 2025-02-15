# handle ports requring sbrk
#
# Feature:		sbrk
# Usage:		USES=sbrk
# Valid ARGS:		lib
# ARGS description:
# lib			Link with libsbrk on OS versions that require it
#			(subject to the port supporting LDFLAGS).
#			Add -D_WANT_SBRK so sbrk() is declared iN unistd.h.
#
# Where sbrk is entierly unavailable (aarch64 and riscv64 prior to
# FreeBSD 15) or requires extra effort to link (FreeBSD 15), handle that
# case.  With no argument or where there is no workaround, mark ports broken.
#
# MAINTAINER:	brooks@FreeBSD.org

.if !defined(_INCLUDE_USES_SBRK_MK)
_INCLUDE_USES_SBRK_MK=	yes

_NOBRK_VERSION=	1500050

_valid_ARGS=	lib

.  for arg in ${sbrk_ARGS}
.    if empty(_valid_ARGS:M${arg})
IGNORE=	Incorrect 'USES+=sbrk:${sbrk_ARGS:ts,}' usage: argument [${arg}] is not recognized
.    endif
.  endfor

.  if ${OSVERSION} < ${_NOBRK_VERSION}
BROKEN_aarch64=	requires sbrk
BROKEN_riscv64=	requires sbrk
.  else
.    if empty(sbrk_ARGS)
BROKEN?=	requires sbrk
.    endif
.    if ${sbrk_ARGS:Mlib}
LIB_DEPENDS+=	libsbrk.so:devel/libsbrk
CFLAGS+=	-D_WANT_SBRK
LDFLAGS+=	-lsbrk
.    endif
.  endif
.endif
