
# Copyright 1999-2012 Funtoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Allows bind read data and also write data back (DNS Updates) to an LDAP backend."
HOMEPAGE="https://fedorahosted.org/bind-dyndb-ldap"
PVGET="$(echo ${PV} | tr -d '_' )"
SRC_URI="https://fedorahosted.org/released/${PN}/${PN}-${PVGET}.tar.bz2"
S=${WORKDIR}/${PN}-${PVGET}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=net-dns/bind-9.8.1_p1[dyndb]
	 >=app-crypt/mit-krb5-1.10.1
	 >=net-nds/openldap-2.4.28-r1[kerberos]"

src_unpack() {
    unpack ${A}
    cd "${S}"
}
