PORTNAME=	apache-rat
PORTVERSION=	0.13
CATEGORIES=	devel java
MASTER_SITES=	APACHE/creadur/${PORTNAME}-${PORTVERSION}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-bin

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Release audit tool
WWW=		https://creadur.apache.org/rat/

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		java tar:bzip2

NO_BUILD=	yes
NO_ARCH=	yes
DATADIR=	${JAVASHAREDIR}/${PORTNAME}

PORTDOCS=	README-ANT.txt README-CLI.txt README.txt

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

SUB_FILES=	apache-rat.sh

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}-${PORTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
	${INSTALL_SCRIPT} ${WRKDIR}/apache-rat.sh ${STAGEDIR}${PREFIX}/bin/apache-rat

do-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
