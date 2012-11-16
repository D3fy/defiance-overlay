# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

inherit apache-module eutils depend.apache

DESCRIPTION="Stanford's authentication module for kerberos and apache"
HOMEPAGE="http://webauth.stanford.edu/"
p=${P##'mod_'}
SRC_URI="http://webauth.stanford.edu/dist/${p}.tar.gz"
S=${WORKDIR}/${p}
LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ldap perl webkdc"
DEPEND=">=dev-libs/openssl-0.9.7
	>=www-servers/apache-2.0.43
	net-misc/curl
	virtual/krb5
	ldap? ( 
		>=net-nds/openldap-2.0
		>=dev-libs/cyrus-sasl-2.0 
	)"

RDEPEND="${DEPEND}
	webkdc? (
		dev-perl/HTML-Template
		dev-perl/FCGI
		dev-perl/Crypt-SSLeay
	)"


APACHE2_MOD_FILE="${S}/modules/webauth/.libs/mod_webauth.so"
APACHE2_MOD_DEFINE="WEBAUTH"

if use ldap ; then
	APACHE2_MOD_FILE="${APACHE2_MOD_FILE} \
		${S}/modules/ldap/.libs/mod_webauthldap.so"
	APACHE2_MOD_DEFINE="${APACHE2_MOD_DEFINE} WEBAUTHLDAP"
fi
if use webkdc ; then
	APACHE2_MOD_FILE="${APACHE2_MOD_FILE} \
		${S}/modules/webkdc/.libs/mod_webkdc.so"
	APACHE2_MOD_DEFINE="${APACHE2_MOD_DEFINE} WEBKDC"
fi

DOCFILES="INSTALL README"

need_apache2

src_compile() {
	econf \
		$(use_enable webkdc) \
		$(use_enable perl) \
		$(use_enable ldap mod_webauthldap) \
		--with-apache=${APACHE_BASEDIR} \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install()
{
	mkdir .libs
	cp -R  modules/webauth/.libs/* .libs/
	apache-module_src_install
	emake DESTDIR="${D}" install || die "emake install failed"
}
src_test() {
	emake check || die "emake check failed"
}


src_install() {
	emake DESTDIR=${D} install || die "emake install failed"
	# if use webkdc ; then
	# 	emake DESTDIR=${D} install-webkdc || die "emake install-webkdc failed"
	# fi
	apache-module_src_install
	
	insinto ${APACHE_MODULES_CONFDIR}
	doins ${FILESDIR}/14_mod_webauth.conf
	if use ldap ; then
		doins ${FILESDIR}/14_mod_webauthldap.conf
	fi
	if use webkdc ; then
		doins ${FILESDIR}/14_mod_webkdc.conf
	fi

	keepdir /etc/webauth
	insinto /etc/webauth
	if use webkdc ; then
		doins ${FILESDIR}/webkdc.conf
		doins ${S}/src/modules/webkdc/token.acl
	fi

}
