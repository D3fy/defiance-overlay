# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MIYAGAWA
MODULE_VERSION=0.4008
inherit perl-mb-tiny

DESCRIPTION="High-performance preforking PSGI/Plack web server"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ssl test"

RDEPEND="
	test? ( dev-perl/Test-Requires )
	>=dev-perl/Plack-1.2.900
	dev-perl/net-server
	dev-perl/HTTP-Parser-XS
	dev-perl/libwww-perl[ssl?]
	dev-perl/Data-Dump
	dev-perl/Module-Build-Tiny
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
