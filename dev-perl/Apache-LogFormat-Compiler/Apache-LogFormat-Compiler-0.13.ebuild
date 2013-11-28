# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=KAZEBURO
inherit perl-module

DESCRIPTION=""

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-perl/Try-Tiny
	dev-perl/Test-Requires
	dev-perl/URI
	dev-perl/HTTP-Message
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
