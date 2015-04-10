# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-2

AUTOTOOLS_AUTORECONF=yes
EGIT_REPO_URI="https://github.com/filefrog/bolo-collectors"

DESCRIPTION="Collector Scripts for bolo"
HOMEPAGE="https://github.com/filefrog/bolo-collectors"

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
