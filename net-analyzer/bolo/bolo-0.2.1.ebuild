# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils eutils

AUTOTOOLS_AUTORECONF=yes

DESCRIPTION="The Bolo Monitoring System"
HOMEPAGE="https://github.com/filefrog/bolo"

SRC_URI="https://github.com/filefrog/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~*"
LICENSE="GPL3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-libs/ctap-1.1.5
	>=dev-libs/libvigor-1.1.0
"
RDEPEND="${DEPEND}"
