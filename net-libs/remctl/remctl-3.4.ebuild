# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="A client/server application that supports remote execution of specific commands, using Kerberos GSS-API"
HOMEPAGE="http://www.eyrie.org/~eagle/software/remctl/"
SRC_URI="http://archives.eyrie.org/software/kerberos/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~*"
IUSE="perl php python ruby"

DEPEND="
	virtual/krb5
	perl? ( dev-lang/perl )
	php? ( dev-lang/php )
	python? ( dev-lang/python )
	ruby? ( dev-lang/ruby )
	"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_enable perl) \
		$(use_enable php) \
		$(use_enable python) \
		$(use_enable ruby)
}
