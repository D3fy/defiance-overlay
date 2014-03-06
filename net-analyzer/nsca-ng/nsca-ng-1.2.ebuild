# Distributed under the terms of the GNU General Public License v2

EAPI=5
AUTOTOOLS_AUTORECONF=yes
AUTOTOOLS_IN_SOURCE_BUILD=1

inherit base autotools-utils eutils

DESCRIPTION="A Nagios add-on for transferring check results "
HOMEPAGE="http://www.nsca-ng.org/"
SRC_URI="http://www.nsca-ng.org/cgi-bin/repository/nsca-ng/snapshot/${P}.tar.gz"

LICENSE="LGL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+aio +libev minimal"

DEPEND="
	>=dev-libs/openssl-1.0.0
	>=dev-libs/libev-4.00
	>=dev-libs/confuse-2.6
"
RDEPEND="${DEPEND}"

src_configure() {
	local myconf
	if use libev ; then
		myconf="${myconf} --with-ev=external"
	else
		myconf="${myconf} --with-ev=embedded"
	fi
	econf \
		$myconf \
		$(use_enable aio posix-aio) \
		$(use_enable !minimal server )
}
