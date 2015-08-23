# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-2

DESCRIPTION="Pam module for Google Authenticator (2-factor)"
HOMEPAGE="https://github.com/google/google-authenticator"
EGIT_REPO_URI="https://github.com/thespooler/google-authenticator"

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=yes

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~*"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	cd ${ECONF_SOURCE:-.}/libpam
	eautoreconf
}

src_configure() {
	cd ${ECONF_SOURCE:-.}/libpam
	econf
}

src_compile() {
	cd ${ECONF_SOURCE:-.}/libpam
	emake || die "emake failed"
}

src_install() {
	cd ${ECONF_SOURCE:-.}/libpam
	emake DESTDIR="${D}" install
}
