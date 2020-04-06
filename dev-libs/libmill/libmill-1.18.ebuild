# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Go-style concurrency for C"
HOMEPAGE="http://libmill.org/"
SRC_URI="https://github.com/sustrik/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~arm ~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
