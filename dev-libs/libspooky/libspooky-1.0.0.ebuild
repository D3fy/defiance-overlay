# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=yes

DESCRIPTION="Spooky hash lib"
HOMEPAGE="https://github.com/graytshirt/libspooky"
SRC_URI="https://github.com/graytshirt/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="*"

LICENSE="GPL3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
