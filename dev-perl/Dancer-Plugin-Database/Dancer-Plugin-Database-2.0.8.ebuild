# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=AMBS
MODULE_VERSION=2.08
inherit perl-module

DESCRIPTION="Database connector for Dancer"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
SRC_URI="http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Dancer/${PN}-${MODULE_VERSION}.tar.gz -> ${P}.tar.gz"
IUSE=""

RDEPEND="
	virtual/perl-ExtUtils-MakeMaker
	dev-perl/DBI
	dev-perl/Dancer
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
