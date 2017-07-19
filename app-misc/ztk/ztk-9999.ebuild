# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

EGIT_REPO_URI="https://github.com/jhunt/ztk.git"

KEYWORDS="~amd64 ~x86"

if [[ ${PV} != 9999 ]] ; then
	# Set the commit ID
	EGIT_COMMIT="d281485889402c837dc254a2f321c9dcbd1f9d87"
fi

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=yes

DESCRIPTION="ZeroMQ Toolkit"
HOMEPAGE="https://github.com/jhunt/ztk"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-libs/ctap-1.1.5
	dev-libs/libsodium
	net-libs/zeromq
"
RDEPEND="${DEPEND}"
