# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="ROKR"
inherit perl-module

DESCRIPTION="Recursively merge two or more hashes, simply"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-Storable
	dev-perl/Clone
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
