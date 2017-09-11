# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3 toolchain-funcs

DESCRIPTION="Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)"
HOMEPAGE="https://fedorahosted.org/bind-dyndb-ldap/"
EGIT_REPO_URI="https://github.com/freeipa/bind-dyndb-ldap"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=">=net-dns/bind-9.11[dlz]"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf

	eapply_user
}
