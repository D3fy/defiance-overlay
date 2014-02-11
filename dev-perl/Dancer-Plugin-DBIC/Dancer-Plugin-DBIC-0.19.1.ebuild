# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=IRONCAMEL
MODULE_VERSION=0.1901
inherit perl-module

DESCRIPTION="DBIx::Class interface for Dancer applications"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	virtual/perl-Module-Load
	virtual/perl-ExtUtils-MakeMaker
	dev-perl/Dancer
	dev-perl/DBIx-Class
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
