# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Spooky hash lib"
HOMEPAGE="https://github.com/graytshirt/libspooky"
SRC_URI="https://github.com/graytshirt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="arm amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
