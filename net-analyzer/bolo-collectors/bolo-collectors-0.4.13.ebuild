# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base autotools-utils eutils

AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=1

DESCRIPTION="Collector Scripts for bolo"
HOMEPAGE="http://bolo.niftylogic.com/"

SRC_URI="https://github.com/bolo/${PN}/releases/download/v${PV}/${P}.tar.gz"
KEYWORDS="~*"
LICENSE="GPLv3"
SLOT="0"
IUSE="+http +iptables mysql postgres rrdtool snmp"

DEPEND="
	>=dev-libs/libvigor-1.1.0
	http?     ( net-misc/curl )
	iptables? ( net-firewall/iptables[ipv6] )
	mysql?    ( virtual/mysql )
	postgres? ( dev-db/postgresql )
	rrdtool?  ( net-analyzer/rrdtool )
	snmp?     ( dev-perl/Net-SNMP )
"
RDEPEND="${DEPEND}"

src_configure() {
	econf \
		$(use_with http httpd-collector) \
		$(use_with iptables fw-collector) \
		$(use_with mysql mysql-collector) \
		$(use_with postgres postgres-collector) \
		$(use_with rrdtool rrdcache-collector)
}
