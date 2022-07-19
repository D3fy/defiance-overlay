# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="FAYLAND"
inherit perl-module

DESCRIPTION="Perl Interface for github.com"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/JSON-Any
	dev-perl/URI
	dev-perl/Moo
	dev-perl/libwww-perl[ssl]
	dev-perl/Type-Tiny
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
