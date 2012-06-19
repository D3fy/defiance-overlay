# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit apache-module

DESCRIPTION="Stanford's authentication module for kerberos and apache"
HOMEPAGE="http://webauth.stanford.edu/"
p=${P##'mod_'}
SRC_URI="http://webauth.stanford.edu/dist/${p}.tar.gz"
S=${WORKDIR}/${p}
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="virtual/krb5
	net-nds/openldap"

RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="14_${PN}"
APACHE2_MOD_DEFINE="WEBAUTH"
DOCFILES="INSTALL README"

need_apache

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install()
{
	mkdir .libs
	cp -R  modules/webauth/.libs/* .libs/
	apache-module_src_install
}

pkg_postinst() {
	/usr/bin/install -c ${S}/modules/webauth/.libs/mod_webauth.soT ${APACHE_MODULESDIR}/mod_webauth.so
        /usr/bin/install -c ${S}/modules/webauth/.libs/mod_webauth.lai ${APACHE_MODULESDIR}/mod_webauth.la
        apache-module_pkg_postinst
}

