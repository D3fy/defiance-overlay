# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Operating system and container binary deployment and upgrades"
HOMEPAGE="https://ostree.readthedocs.io/en/latest/"
SRC_URI="https://github.com/ostreedev/${PN}/releases/download/v${PV}/lib${P}.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


