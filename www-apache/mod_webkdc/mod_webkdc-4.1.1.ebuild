# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit apache-module

DESCRIPTION="Stanford's authentication module for kerberos and apache"
HOMEPAGE="http://webauth.stanford.edu/"
p='webauth'
pd=${p}-${PV}
SRC_URI="http://webauth.stanford.edu/dist/${pd}.tar.gz"

S=${WORKDIR}/${pd}
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="virtual/krb5
	net-nds/openldap
	www-apache/mod_fastcgi"

RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="14_${PN}"
APACHE2_MOD_DEFINE="WEBKDC"
DOCFILES="INSTALL README"

need_apache

src_compile() {
	econf --enable-webkdc --disable-mod_webauth --disable-mod_webauthldap || die "econf failed"
	emake || die "emake failed"
}

src_install()
{
	mkdir .libs
	cp -R  modules/webkdc/.libs/* .libs/
	apache-module_src_install
#	einstall || die "emake failed"
	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_postinst() {
        apache-module_pkg_postinst
	/usr/bin/install -c ${S}/modules/webkdc/.libs/mod_webkdc.so ${APACHE_MODULESDIR}/mod_webkdc.so
        /usr/bin/install -c ${S}/modules/webkdc/.libs/mod_webkdc.lai ${APACHE_MODULESDIR}/mod_webkdc.la
	elog "for more information on configuration go here:"
	elog "http://webauth.stanford.edu/manual/mod/mod_webkdc.html"
}

