# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=yes

DESCRIPTION="Test Anything Protocol (tap) for C"
HOMEPAGE="https://github.com/jhunt/ctap/"
SRC_URI="https://github.com/jhunt/${PN}/releases/download/v${PV}/${P}.tar.gz"

KEYWORDS="*"
SLOT="0"
LICENSE="GPL3"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
