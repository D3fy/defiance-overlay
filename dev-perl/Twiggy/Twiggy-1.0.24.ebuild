# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MIYAGAWA
MODULE_VERSION=0.1024
inherit perl-module

DESCRIPTION="AnyEvent HTTP server for PSGI (like Thin)"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+starter test"

RDEPEND="
	dev-perl/Try-Tiny
	dev-perl/AnyEvent
	dev-perl/Plack
"
DEPEND="${RDEPEND}
	test?    ( dev-perl/Test-Requires )
	starter? ( dev-perl/Server-Starter )
"

SRC_TEST="do"
