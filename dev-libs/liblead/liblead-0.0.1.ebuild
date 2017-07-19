# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="High density shim library"
HOMEPAGE="https://github.com/graythshirt/liblead"
SRC_URI="https://github.com/graytshirt/${PN}/releases/${P}.tar.xz"
KEYWORDS="~arm ~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake -j1 || die
}
