# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="a library for lazy people"
HOMEPAGE="https://github.com/graythshirt/liblazy"
SRC_URI="https://github.com/graytshirt/${PN}/releases/${P}.tar.xz"
KEYWORDS="~*"

LICENSE="GPL3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake -j1 || die
}
