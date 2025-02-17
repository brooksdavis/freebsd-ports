PORTNAME=	libsbrk
PORTVERSION=	1.0
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	brooks@FreeBSD.org
COMMENT=	Wrapper library for sbrk compat symbol
WWW=		# none

LICENSE=	BSD2CLAUSE

IGNORE_FreeBSD_13=	${IGNORE_FreeBSD_14}
IGNORE_FreeBSD_14=	use sbrk directly from libc

USES=	uidfix
USE_LDCONFIG=	yes

NO_WRKSUBDIR=	yes
#PORTDOCS=	README

OPTIONS_DEFINE=	DOCS
DOCS_PLIST_FILES=	share/man/man2/sbrk.2.gz

PLIST_FILES=	lib/libsbrk.a lib/libsbrk.so lib/libsbrk.so.1

SRCS=		Makefile Symbol.map Versions.def sbrk.2 sbrk.c

do-extract:
	@${MKDIR} ${WRKSRC}
	${LN} -sf ${SRCS:S|^|${FILESDIR}/|} ${WRKSRC}

.include <bsd.port.mk>
