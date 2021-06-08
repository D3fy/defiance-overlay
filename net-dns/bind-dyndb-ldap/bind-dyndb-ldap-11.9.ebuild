# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools toolchain-funcs eutils

DESCRIPTION="Bind DynDB LDAP backend (replacement for sdb-ldap and dlz)"
HOMEPAGE="https://pagure.io/bind-dyndb-ldap"

KEYWORDS=""

if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://pagure.io/bind-dyndb-ldap.git"
	inherit git-r3
else
	SRC_URI="https://pagure.io/${PN}/archive/v${PV}/${PN}-v${PV}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-v${PV}"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	>=net-dns/bind-9.16.0[dlz]
	dev-libs/cyrus-sasl:=
	virtual/krb5
"

RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
