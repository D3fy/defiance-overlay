# Distributed under the terms of the GNU General Public License v2

EAPI=4

MODULE_AUTHOR=POLETTIX
inherit perl-module

DESCRIPTION="Dancer adapter for Log::Log4perl"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-perl/Dancer
	virtual/perl-ExtUtils-MakeMaker
	dev-perl/Log-Log4perl
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
