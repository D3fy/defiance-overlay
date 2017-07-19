# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="The missing bits of C"
HOMEPAGE="https://github.com/jhunt/libvigor"
SRC_URI="https://github.com/jhunt/${PN}/releases/download/v${PV}/${P}.tar.gz"
KEYWORDS="~arm ~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DEPEND="
	dev-libs/libsodium
	net-libs/zeromq
	test? ( dev-libs/ctap )
"
RDEPEND="
	dev-libs/libsodium
	net-libs/zeromq
"

src_compile() {
	emake -j1 || die
}
