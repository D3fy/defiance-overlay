# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="GSHANK"
inherit perl-module

DESCRIPTION="An interface to functions that assist in working with salted hashes"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/perl-ExtUtils-MakeMaker
	dev-perl/Test-Fatal
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
