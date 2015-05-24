# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base autotools-utils eutils

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="Collector Scripts for bolo"
HOMEPAGE="https://github.com/filefrog/bolo-collectors"

SRC_URI="https://github.com/filefrog/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~*"
LICENSE="GPLv3"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-libs/libvigor-1.1.0
	net-misc/curl
	net-analyzer/rrdtool
	net-firewall/iptables[ipv6]
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
