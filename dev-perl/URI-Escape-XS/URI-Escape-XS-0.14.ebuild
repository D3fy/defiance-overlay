# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="DANKOGAI"
inherit perl-module

DESCRIPTION="Drop-In replacement for URI::Escape"

LICENSE="|| ( Artistic GPL-1+ GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~*"
IUSE=""

RDEPEND="
	virtual/perl-ExtUtils-MakeMaker
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
