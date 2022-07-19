# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="TOPAZ"
inherit perl-module

DESCRIPTION="A straightforward Perl WebSocket server with minimal dependencies"

LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Protocol-WebSocket"
DEPEND="${RDEPEND}"
