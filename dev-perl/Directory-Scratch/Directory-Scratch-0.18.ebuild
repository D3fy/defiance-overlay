# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="ETHER"

inherit perl-module

DESCRIPTION="self-cleaning scratch space for tests"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"
IUSE=""

DEPEND="
	dev-perl/Path-Class
	>=dev-perl/File-Slurp-9999.190.0
"
