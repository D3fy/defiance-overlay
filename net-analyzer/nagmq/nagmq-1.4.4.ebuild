# Distributed under the terms of the GNU General Public License v2

EAPI=5
AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=1

inherit base autotools-utils eutils vcs-snapshot

DESCRIPTION="Nagios event broken writen with libev and zeromq"
HOMEPAGE="https://groups.google.com/d/forum/nagmq"
SRC_URI="https://github.com/jbreams/nagmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	dev-libs/jansson
	dev-libs/libev
	net-libs/zeromq
"
RDEPEND="${DEPEND}"

src_prepare () {
	epatch "${FILESDIR}"/${PN}-1.4.4-am_prog.patch
	eautoreconf
}
