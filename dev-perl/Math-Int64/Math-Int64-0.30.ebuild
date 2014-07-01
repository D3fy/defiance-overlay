# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="SALVA"
inherit perl-module

DESCRIPTION="Manipulate 64 bits integers in Perl"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	virtual/perl-ExtUtils-MakeMaker
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
