# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=yes

DESCRIPTION="Test Anything Protocol (tap) for C"
HOMEPAGE="https://github.com/jhunt/ctap/"
SRC_URI="https://github.com/jhunt/${PN}/releases/download/v${PV}/${P}.tar.gz"

KEYWORDS="~arm ~amd64 ~x86"
SLOT="0"
LICENSE="GPL-3"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
