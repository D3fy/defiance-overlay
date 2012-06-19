# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit apache-module

DESCRIPTION="Stanford's authentication module for kerberos and apache"
HOMEPAGE="http://webauth.stanford.edu/"
p=${PN##'mod_'}
pd=${p%%ldap}-${PV}
SRC_URI="http://webauth.stanford.edu/dist/${pd}.tar.gz"
S=${WORKDIR}/${pd}
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="virtual/krb5
	net-nds/openldap"

RDEPEND="${DEPEND}"

APACHE2_MOD_CONF="17_${PN}"
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
	cp -R  modules/ldap/.libs/* .libs/
	apache-module_src_install
}

pkg_postinst() {
        /usr/bin/install -c ${S}/modules/ldap/.libs/mod_webauthldap.so ${APACHE_MODULESDIR}/mod_webauthldap.so
        /usr/bin/install -c ${S}/modules/ldap/.libs/mod_webauthldap.lai ${APACHE_MODULESDIR}/mod_webauthldap.la
        apache-module_pkg_postinst
}

