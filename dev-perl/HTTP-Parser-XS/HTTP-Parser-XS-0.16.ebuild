# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=KAZUHO
inherit perl-module

DESCRIPTION="a fast, primitive HTTP request parser"

#LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	virtual/perl-ExtUtils-MakeMaker
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
